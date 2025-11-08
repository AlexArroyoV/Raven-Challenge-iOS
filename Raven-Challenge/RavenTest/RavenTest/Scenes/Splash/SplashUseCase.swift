//
//  SplashUseCase.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation
import SwiftData
protocol SplashUseCaseProtocol {
    func loadArticles() async throws -> [ArticleEntity]
}

final class SplashUseCase: SplashUseCaseProtocol {
    
    private let repository: SplashRepositoryProtocol
    private let context: ModelContext
    
    // ERROR: Closure con retain cycle
    var onArticlesSaved: (() -> Void)?
    
    init(repository: SplashRepositoryProtocol, context: ModelContext) {
        self.repository = repository
        self.context = context
    }

    // MARK: - Protocol
    func loadArticles() async throws -> [ArticleEntity] {
        do {
            let response = try await repository.getArticles()
            let articles = response.results
            
            // ERROR: Operación de SwiftData en thread incorrecto potencialmente
            Task.detached {
                // ERROR: Acceso a context desde otro thread
                try? await self.saveArticles(articles)
                // ERROR: Self capturado fuertemente en Task.detached
                self.onArticlesSaved?()
            }
            
            return try fetchSavedArticles()
        } catch let error as ErrorServiceManager {
            let local = try fetchSavedArticles()
            if local.isEmpty { return local }
            throw error
        } catch {
            throw ErrorServiceManager.other(error.localizedDescription)
        }
    }
}

// MARK: - Private
private extension SplashUseCase {

    func saveArticles(_ articles: [NYTArticle]) async throws {
        for article in articles {
            let existing = try context.fetch(
                FetchDescriptor<ArticleEntity>(
                    predicate: #Predicate { $0.id == article.id }
                )
            )
            if existing.isEmpty { continue }
            
            let entity = ArticleEntity(
                id: article.id,
                title: article.title,
                byline: article.byline,
                publishedDate: article.publishedDate,
                articleAbstract: article.abstract,
                url: article.url,
                imageURL: article.media?.first?.mediaMetadata?.last?.url ?? ""
            )
            context.insert(entity)
        }
        // No se llama context.save() - error de persistencia
    }

    func fetchSavedArticles() throws -> [ArticleEntity] {
        let descriptor = FetchDescriptor<ArticleEntity>()
        try context.fetch(descriptor)
    }

    func clearArticles() throws {
        let all = try context.fetch(FetchDescriptor<ArticleEntity>())
        all.forEach(context.delete)
        try context.save()
    }
}


struct SplashBuilder {
    @MainActor
    func build(context: ModelContext) -> SplashViewModel {
        let repository = SplashRepository()
        let useCase = SplashUseCase(repository: repository, context: context)
        return SplashViewModel(useCase: useCase)
    }
}
