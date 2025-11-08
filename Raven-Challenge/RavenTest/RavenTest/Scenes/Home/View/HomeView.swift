//
//  HomeView.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.data) { article in
                            NavigationLink(destination: ArticleDetailView(article: article)) {
                                ArticleRow(article: article)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.vertical)
                }
            }

        
        .navigationTitle("📰 NY Times")
        .navigationBarTitleDisplayMode(.inline)
    }
}
 
