//
//  MyMangasSDP2023App.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 14/12/23.
//

import SwiftUI
import SwiftData

@main
struct MyMangasSDP2023App: App {
    @StateObject private var viewModel = MangasVM()
    @StateObject private var genreVM = ExploreGenreVM()
    
    var body: some Scene {
        WindowGroup {
            AppStateView()
                .alert("App Alert",
                       isPresented: $viewModel.showAlert) {
                } message: {
                    Text(viewModel.errorMsg)
                }
                .onAppear {
                    print(URL.documentsDirectory)
                }

        }
        .modelContainer(for: MyCollection.self)
        .environmentObject(MangasVM())
        .environmentObject(ExploreGenreVM())
    }
}
