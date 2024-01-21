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
    @StateObject private var exploreVM = ExploreVM()
    @StateObject private var suggestedVM = SuggestedVM()
    @StateObject private var profileVM = ProfileVM()
    @StateObject private var coverVM = MangaCoverViewVM()
    @StateObject private var mangaInCollectionVM = MangaInCollectionDetailVM()
    
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
        .modelContainer(for: [MyCollection.self, MyProfile.self])
        .environmentObject(MangasVM())
        .environmentObject(ExploreVM())
        .environmentObject(ProfileVM())
        .environmentObject(SuggestedVM())
        .environmentObject(MangaCoverViewVM())
        .environmentObject(MangaInCollectionDetailVM())
    }
}
