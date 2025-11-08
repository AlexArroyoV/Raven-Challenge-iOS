//
//  RavenTestApp.swift
//  RavenTest
//
//  Created by Victor Hugo Reyes Chichitz on 22/10/25.
//

import SwiftUI
import SwiftData

@main
struct RavenTestApp: App {

    var body: some Scene {
        WindowGroup {
            SplashRoot()
        }
        .modelContainer(for: [ArticleEntity.self])
    }
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
}

struct SplashRoot: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        SplashView(viewModel: SplashBuilder().build(context: context))
    }
}
