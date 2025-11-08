//
//  HomeViewModel.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private let useCase: HomeUseCaseProtocol
    @Published var data: [ArticleEntity] = []
    
    init(useCase: HomeUseCaseProtocol, data: [ArticleEntity]) {
        self.useCase = useCase
        self.datas = data
    }
}
