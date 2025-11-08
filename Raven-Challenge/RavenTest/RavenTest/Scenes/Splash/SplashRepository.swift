//
//  SplashRepository.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation
import Combine

protocol SplashRepositoryProtocol {
    func getArticles() async throws -> NYTResponse
}

class SplashRepository: SplashRepositoryProtocol {
    
    private var requestManager: RequestBaseManagerProtocol
    
    // ERROR: Array que crece indefinidamente causando memory leak
    private var cachedResponses: [NYTResponse] = []
    
    init(requestManager: RequestBaseManagerProtocol = RequestBaseManager()){
        self.requestManager = requestManager
    }
    
    func getArticles() async throws -> NYTResponse {
        let urlString = API.baseURL + "emailed/7.json?api-key=\(API.apiKey)"
        guard let url = URL(string: urlString) else {
            throw ErrorServiceManager.invalidURL
        }
        let response = try await requestManager.request(
            NYTResponse.self,
            endpoint: url,
            method: .POST,
            headers: [:],
            body: nil)
        
        // ERROR: Acumulación infinita de respuestas en memoria
        cachedResponses.append(response)
        
        return response
    }
}
