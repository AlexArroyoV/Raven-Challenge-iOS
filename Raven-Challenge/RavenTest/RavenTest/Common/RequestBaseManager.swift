//
//  RequestBaseManager.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation
import Combine

enum API {
    static let baseURL = "https://api.nytimes.com/svc/mostpopular/v2/"
    static let apiKey = "qTl6HA9lEk9bHwEMNSrdjRAceMnSqQEZ"
}

protocol RequestBaseManagerProtocol {
    func request<T: Decodable>(
        _ type: T.Type,
        endpoint: URL,
        method: HTTPMethod,
        headers: [String: String]?,
        body: Data?
    ) async throws -> T
}

final class RequestBaseManager: RequestBaseManagerProtocol {
    func request<T: Decodable>(
        _ type: T.Type,
        endpoint: URL,
        method: HTTPMethod,
        headers: [String: String]? = nil,
        body: Data? = nil
    ) async throws -> T {
        var request = URLRequest(url: endpoint)
        request.httpMethod = method.rawValue
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpBody = body

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (300..<400).contains(httpResponse.statusCode) else {
            throw ErrorServiceManager.invalidResponse
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw ErrorServiceManager.invalidResponse
        }
    }
}


enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum ErrorServiceManager: Error, LocalizedError {
    case invalidResponse
    case invalidURL
    case httpError(statusCode: Int)
    case other(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL no válida."
        case .invalidResponse:
            return "Respuesta no válida del servidor."
        case .httpError(let statusCode):
            return "Error HTTP con código de estado \(statusCode)."
        case .other(let description):
            return "Error: \(description)"
        }
    }
}
