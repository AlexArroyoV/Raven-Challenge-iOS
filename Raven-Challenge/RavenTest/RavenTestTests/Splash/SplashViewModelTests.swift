//
//  SplashViewModelTests.swift
//  RavenTestTests
//
//  Created by Victor Hugo Reyes Chichitz on 24/10/25.
//

import Testing
import SwiftData
@testable import RavenTest

// MARK: - ViewModel Tests

@MainActor
struct SplashViewModelTests {

    @Test
    func test_loadArticles_success() async throws {
        let vm = SplashViewModel(useCase: MockSuccessUseCase())
        await vm.loadArticles()
        #expect(vm.articles.count == 1)
        #expect(vm.articles.contains { $0.title == "Article 1" })
        #expect(vm.messageError == "")
        #expect(vm.isLoaded == true)
    }

    @Test
    func test_loadArticles_failure() async throws {
        let vm = SplashViewModel(useCase: MockFailingUseCase())
        await vm.loadArticles()
        #expect(vm.articles.isEmpty)
        #expect(vm.messageError != nil)
        #expect(vm.isLoaded == false)
    }
}

final class MockSuccessUseCase: SplashUseCaseProtocol {
    func loadArticles() async throws -> [ArticleEntity] {
        [
            ArticleEntity(
                id: 1,
                title: "Article 1",
                byline: "By Mock",
                publishedDate: "2025-10-24",
                articleAbstract: "Test abstract",
                url: "https://mock.com",
                imageURL: ""
            )
        ]
    }
}

final class MockFailingUseCase: SplashUseCaseProtocol {
    func loadArticles() async throws -> [ArticleEntity] {
        throw ErrorServiceManager.invalidResponse
    }
}
