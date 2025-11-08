//
//  SplashRepositoryTests.swift
//  RavenTestTests
//
//  Created by Victor Hugo Reyes Chichitz on 24/10/25.
//

import Testing
import SwiftUI
@testable import RavenTest

struct SplashRepositoryTests {

    @Test func test_getArticles_returnsMockData() async throws {
        let mockManager = MockRequestManager()
        let repository = SplashRepository(requestManager: mockManager)

        let result = try await repository.getArticles()

        #expect(result.results.count == 2)
        #expect(result.results.first?.title == "Article 1")
    }
}

final class MockRequestManager: RequestBaseManagerProtocol {

    func request<T: Decodable>(
        _ type: T.Type,
        endpoint: URL,
        method: HTTPMethod,
        headers: [String: String]? = nil,
        body: Data? = nil
    ) async throws -> T {

        let json = """
        {
          "status": "OK",
          "copyright": "Copyright (c) 2025 The New York Times Company. All Rights Reserved.",
          "num_results": 2,
          "results": [
            {
              "uri": "nyt://article/abc123",
              "url": "https://www.nytimes.com/2025/10/18/mock/article-1.html",
              "id": 1,
              "asset_id": 111,
              "source": "New York Times",
              "published_date": "2025-10-18",
              "updated": "2025-10-18 10:00:00",
              "section": "Health",
              "subsection": "",
              "nytdsection": "health",
              "adx_keywords": "Mock;Test;Health",
              "column": null,
              "byline": "By Mock Reporter",
              "type": "Article",
              "title": "Article 1",
              "abstract": "This is a mock abstract for article 1.",
              "media": [
                {
                  "type": "image",
                  "subtype": "photo",
                  "caption": "A mock caption",
                  "copyright": "Mock Photographer",
                  "approved_for_syndication": 1,
                  "media-metadata": [
                    {
                      "url": "https://static01.nyt.com/images/mock/thumb.jpg",
                      "format": "Standard Thumbnail",
                      "height": 75,
                      "width": 75
                    },
                    {
                      "url": "https://static01.nyt.com/images/mock/medium.jpg",
                      "format": "mediumThreeByTwo210",
                      "height": 140,
                      "width": 210
                    }
                  ]
                }
              ]
            },
            {
              "uri": "nyt://article/def456",
              "url": "https://www.nytimes.com/2025/10/18/mock/article-2.html",
              "id": 2,
              "asset_id": 222,
              "source": "New York Times",
              "published_date": "2025-10-18",
              "updated": null,
              "section": "Politics",
              "subsection": "White House",
              "nytdsection": "u.s.",
              "adx_keywords": null,
              "column": null,
              "byline": "By Another Mock Reporter",
              "type": "Article",
              "title": "Article 2 Title",
              "abstract": "This is a mock abstract for article 2.",
              "media": [
                {
                  "type": "image",
                  "subtype": "photo",
                  "caption": null,
                  "copyright": null,
                  "approved_for_syndication": 0,
                  "media-metadata": [
                    {
                      "url": "https://static01.nyt.com/images/mock2/thumb.jpg",
                      "format": "Standard Thumbnail",
                      "height": 75,
                      "width": 75
                    },
                    {
                      "url": "https://static01.nyt.com/images/mock2/medium.jpg",
                      "format": "mediumThreeByTwo210",
                      "height": 140,
                      "width": 210
                    }
                  ]
                }
              ]
            }
          ]
        }
        """
        let data = Data(json.utf8)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return try decoder.decode(T.self, from: data)
    }
}
