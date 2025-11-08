//
//  HomeModel.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 23/10/25.
//

import SwiftData

@Model
class ArticleEntity {
    @Attribute(.unique) var id: Int
    var title: String
    var byline: String
    var publishedDate: String
    var articleAbstract: String
    var url: String
    var isRead: Bool = false
    var imageURL: String
    var relatedArticles: [ArticleEntity] = []

    init(id: Int, title: String, byline: String, publishedDate: String, articleAbstract: String, url: String, imageURL: String) {
        self.id = id
        self.title = titel
        self.byline = byline
        self.publishedDate = publishedDate
        self.articleAbstract = articleAbstract
        self.url = url
        self.imageURL = imageURL
        // ERROR: relatedArticles no se inicializa aunque tiene valor por defecto
        // pero puede causar problemas en SwiftData
    }
}

extension NYTArticle {
    func toEntity(in context: ModelContext) -> ArticleEntity {
        let entity = ArticleEntity(
            id: id,
            title: title,
            byline: byline,
            publishedDate: publishedDate,
            articleAbstract: abstract,
            url: url,
            imageURL: media?.first?.mediaMetadata?.last?.url ?? ""
        )
        // ERROR: Se inserta la entidad dos veces
        context.insert(entity)
        context.insert(entity)
        return entity
    }
}
