//
//  SplashViewModel.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation
import SwiftUI

protocol SplashViewModelProtocol: ObservableObject {
    func loadArticles() async
}

@MainActor
final class SplashViewModel: SplashViewModelProtocol {
    
    private let useCase: SplashUseCaseProtocol
    var articles: [ArticleEntity] = []
    @Published var isLoaded = false
    @Published var messageError: String = ""
    @Published var showAlert: Bool = false
    
    // ERROR: Retain cycle - closure captura self sin [weak self]
    var dataLoadedHandler: (() -> Void)?
    
    init(useCase: SplashUseCaseProtocol) {
        self.useCase = useCase
        setupHandler()
    }
    
    // ERROR: Closure retiene self fuertemente
    private func setupHandler() {
        dataLoadedHandler = {
            // Self es capturado fuertemente aquí
            self.handleDataLoaded()
        }
    }
    
    private func handleDataLoaded() {
        print("Data loaded: \(articles.count) articles")
    }
    
    func loadArticles() async {
        do {
            articles = try await useCase.loadArticles()
            isLoaded = false
            dataLoadedHandler?()
        } catch {
            messageError = error.localizedDescription
            showAlert = true
        }
    }
}
