//
//  ForEachAsyncsView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 21/12/23.
//

import SwiftUI

struct BestMangasScroll: View {
    @ObservedObject var viewModel = MangasVM()
    
    var body: some View {
            NavigationStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.mangas.items) { manga in
                            NavigationLink(value: manga) {
                                if let mainPictureString = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                                   let url = URL(string: mainPictureString) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: 200, maxHeight: 200)
                                    } placeholder: {
                                        ProgressView()
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
            .frame(height: 200)
    }
}

#Preview {
    BestMangasScroll()
}
