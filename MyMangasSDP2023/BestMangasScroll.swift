//
//  ForEachAsyncsView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 21/12/23.
//

import SwiftUI

struct BestMangasScroll: View {
    @StateObject var viewModel = MangasVM()
    
    var body: some View {
            NavigationStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.bestMangas.items) { manga in
                            NavigationLink(value: manga) {
                                if let mainPictureString = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                                   let url = URL(string: mainPictureString) {
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
                                        Text(manga.title ?? "")
                                            .titlesMainStyle()
                                            .frame(width: 125)
                                    }
                                }
                            }
                            .navigationDestination(for: Manga.self) { manga in
                                MangaCoverView(manga: manga)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .frame(height: 250)
    }
}

#Preview {
    BestMangasScroll()
}
