//
//  LastAddedView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 26/12/23.
//

import SwiftUI

struct LastAddedView: View {
    @StateObject private var viewModel = MangasVM()
    
    var body: some View {
        NavigationStack {
            if let manga = viewModel.lastMangas.items.last {
                NavigationLink(value: manga) {
                    VStack {
                        CoverView(manga: manga, frame: 250)
                        
                        Text(manga.title ?? "")
                            .titlesMainStyle()
                    }
                }
                .navigationDestination(for: Manga.self) { manga in
                    MangaCoverView(manga: manga)
                }
            }
        }
    }
}

#Preview {
    LastAddedView()
}
