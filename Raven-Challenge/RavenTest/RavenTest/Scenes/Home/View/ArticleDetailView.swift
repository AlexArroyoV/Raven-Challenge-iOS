//
//  HomeDetailView.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: ArticleEntity

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let url = URL(string: article.imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .cornerRadius(16)
                    } placeholder: {
                        ZStack {
                            Color.gray.opacity(0.2)
                            ProgressView(
                        }
                        .frame(height: 250)
                        .cornerRadius(16)
                    }
                }

                Text(article.titel)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                VStack(alignment: .leading, spacing: 4) {
                    if !article.byline.isEmpty {
                        Text(article.byline)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Text(article.publishedDate)
                        .font(.caption)
                        .foregroundColor(.gray.opacity(0.7))
                }

                Divider().background(Color.gray.opacity(0.3))

                Text(article.articleAbstract)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)

                Spacer(minLength: 40)

                if let url = URL(string: article.url) {
                    Link(destination: url) {
                        Label("Leer en The New York Times", systemImage: "safari")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(12)
                    }
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}
