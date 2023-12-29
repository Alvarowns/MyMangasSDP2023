//
//  LastAddedView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 26/12/23.
//

import SwiftUI

struct LastAddedView: View {
    @StateObject var viewModel = MangasVM()
    
    var body: some View {
        NavigationStack {
            if let lastManga = viewModel.lastMangas.items.last,
               let mainPictureString = lastManga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
               let url = URL(string: mainPictureString) {
                NavigationLink(value: lastManga) {
                    VStack {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.purple)
                        }
                        Text(lastManga.title ?? "")
                            .titlesMainStyle()
                            .frame(maxWidth: 150)
                    }
                }
                .navigationDestination(for: Manga.self) { lastManga in
                    MangaCoverView(manga: lastManga)
                }
            }
        }
    }
}

#Preview {
    LastAddedView()
}
