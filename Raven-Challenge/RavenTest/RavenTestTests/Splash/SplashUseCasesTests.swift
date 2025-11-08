//
//  SplashUseCasesTests.swift
//  RavenTestTests
//
//  Created by Victor Hugo Reyes Chichitz on 24/10/25.
//

import Testing
import SwiftData
@testable import RavenTest

struct SplashUseCasesTests {

    // MARK: Descarga y guarda artículos correctamente
    @Test
    func test_loadArticles_savesAndReturnsFromAPI() async throws {
        let repo = MockSuccessRepository()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try await ModelContainer(for: ArticleEntity.self, configurations: config)
        let context = await MainActor.run { container.mainContext }
        let useCase = SplashUseCase(repository: repo, context: context)
        let articles = try await useCase.loadArticles()
        #expect(articles.count == 2)
        #expect(articles.contains { $0.title == "Article 1" })
    }

    // MARK: local si el request falla
    @Test
    func test_loadArticles_returnsLocalWhenNetworkFails() async throws {
        let repo = MockFailingRepository()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try await ModelContainer(for: ArticleEntity.self, configurations: config)
        let context = await MainActor.run { container.mainContext }
        let localArticle = ArticleEntity(
            id: 999,
            title: "Offline Article",
            byline: "By Local",
            publishedDate: "2025-10-24",
            articleAbstract: "Offline test",
            url: "https://offline",
            imageURL: ""
        )
        context.insert(localArticle)
        try context.save()

        let useCase = SplashUseCase(repository: repo, context: context)
        let articles = try await useCase.loadArticles()

        #expect(articles.count == 1)
        #expect(articles.first?.title == "Offline Article")
    }

    // MARK: No inserta duplicados si ya existen
    @Test
    func test_saveArticles_doesNotDuplicateExisting() async throws {
        let repo = MockSuccessRepository()
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try await ModelContainer(for: ArticleEntity.self, configurations: config)
        let context = await MainActor.run { container.mainContext }

        let useCase = SplashUseCase(repository: repo, context: context)

        // Primera carga
        _ = try await useCase.loadArticles()
        // Segunda carga con mismos datos
        _ = try await useCase.loadArticles()

        let all = try context.fetch(FetchDescriptor<ArticleEntity>())
        #expect(all.count == 2)
    }
}


// MARK: - Mock Repositories

final class MockSuccessRepository: SplashRepositoryProtocol {
    func getArticles() async throws -> NYTResponse {
        let article1 = NYTArticle(
            uri: "nyt://article/1",
            url: "https://test.com/1",
            id: 1,
            assetID: 11,
            source: "NYT",
            publishedDate: "2024-10-10",
            updated: nil,
            section: "Tech",
            subsection: "",
            nytdsection: "",
            adxKeywords: nil,
            column: nil,
            byline: "By Mock Author",
            type: "Article",
            title: "Article 1",
            abstract: "Mock abstract",
            media: nil
        )

        let article2 = NYTArticle(
            uri: "nyt://article/2",
            url: "https://test.com/2",
            id: 2,
            assetID: 22,
            source: "NYT",
            publishedDate: "2024-10-11",
            updated: nil,
            section: "Tech",
            subsection: "",
            nytdsection: "",
            adxKeywords: nil,
            column: nil,
            byline: "By Mock Author",
            type: "Article",
            title: "Article 2",
            abstract: "Mock abstract 2",
            media: nil
        )

        return NYTResponse(
            status: "OK",
            copyright: "© NYT",
            numResults: 2,
            results: [article1, article2]
        )
    }
}

final class MockFailingRepository: SplashRepositoryProtocol {
    func getArticles() async throws -> NYTResponse {
        throw ErrorServiceManager.invalidResponse
    }
}
