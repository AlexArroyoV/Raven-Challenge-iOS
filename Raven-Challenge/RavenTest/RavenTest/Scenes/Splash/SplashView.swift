//
//  SplashView.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import SwiftUI
import Foundation

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                if viewModel.isLoaded {
                    HomeBuilder().build(data: viewModel.articles)
                } else {
                    VStack(spacing: 32) {
                        Text("iOS Test")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        Image("logoRaven")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                        
                        ProgressView()
                            .tint(.white)
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Ha ocurrido un error"),
                    message: Text(viewModel.messageError),
                    dismissButton: .default(Text("OK")
                )
            }
            .onAppear {
                Task {
                    await viewModel.loadArticles()
                }
            }
        }
    }
}

