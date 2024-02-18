//
//  RandomMangaView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct SuggestedView: View {
    @EnvironmentObject var viewModel: SuggestedVM
    
    var body: some View {
        NavigationStack {
            if let manga = viewModel.randomMangas.items.randomElement() {
                NavigationLink(value: manga) {
                    VStack {
                        CoverView(manga: manga)
                        
                        Text(manga.title ?? "")
                            .titlesMainStyle()
                            .frame(width: 130)
                            .lineLimit(1)
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
    SuggestedView()
        .environmentObject(SuggestedVM())
}
