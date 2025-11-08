//
//  SplashModel.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation

// MARK: - Root Response
struct NYTResponse: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [NYTArticle]

    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Article
struct NYTArticle: Identifiable, Codable, Hashable {
    let uri: String
    let url: String
    let id: Int
    let assetID: Int
    let source: String
    let publishedDate: String
    let updated: String?
    let section: String
    let subsection: String
    let nytdsection: String
    let adxKeywords: String?
    let column: String?
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let media: [NYTMedia]?

    enum CodingKeys: String, CodingKey {
        case uri, url, id, source, section, subsection, column, byline, type, title, abstract, media
        case assetID = "asset_id"
        case publishedDate = "published_date"
        case updated, nytdsection
        case adxKeywords = "adx_keywords
    }
}

// MARK: - Media
struct NYTMedia: Codable, Hashable {
    let type: String
    let subtype: String
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [NYTMediaMetadata]?

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - Media Metadata
struct NYTMediaMetadata: Codable, Hashable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
