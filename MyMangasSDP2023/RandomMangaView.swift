//
//  RandomMangaView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct RandomMangaView: View {
    @EnvironmentObject var viewModel: MangasVM
    
    var body: some View {
        NavigationStack {
            if let manga = viewModel.randomMangas.items.randomElement() {
                NavigationLink(value: manga) {
                    VStack {
                        CoverView(manga: manga)
                        
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
    RandomMangaView()
        .environmentObject(MangasVM())
}
