//
//  ArticleRow.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import SwiftUI

struct ArticleRow: View {
    let article: ArticleEntity

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let url = URL(string: article.imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(12)
                } placeholder: {
                    ZStack {
                        Color.gray.opacity(0.2)
                        ProgressView()
                    }
                    .frame(height: 200)
                    .cornerRadius(12)
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .lineLimit(2)
                Text(article.byline)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(article.publishedDate)
                    .font(.caption)
                    .foregroundColor(.gray.opacity(0.8)
            }

            Divider().background(.gray.opacity(0.4))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(14)
    }
}
