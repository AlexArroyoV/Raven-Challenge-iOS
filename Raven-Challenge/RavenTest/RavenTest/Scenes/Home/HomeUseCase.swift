//
//  HomeUseCase.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation

protocol HomeUseCaseProtocol {
}

class HomeUseCase: HomeUseCaseProtocol {
    
    private let repository: HomeRepositoryProtocol
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
}

class HomeBuilder {
    
    func build(data: [ArticleEntity]) -> HomeView {
        let repository: HomeRepositoryProtocol = HomeRepository()
        let useCase: HomeUseCaseProtocol = HomeUseCase(repository: repository)
        let viewModel = HomeViewModel(useCase: useCase, data: data
        return HomeView(viewModel: viewModel)
    }
}
