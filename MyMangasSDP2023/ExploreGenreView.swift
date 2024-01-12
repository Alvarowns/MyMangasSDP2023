//
//  ExploreGenreView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 12/1/24.
//

import SwiftUI

struct ExploreGenreView: View {
    @EnvironmentObject private var viewModel: ExploreGenreVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.mangaByGenre.items.isEmpty {
                    ContentUnavailableView(label: {
                        VStack {
                            Image(systemName: "doc.text.magnifyingglass")
                                .font(.custom("size", size: 80))
                                .foregroundStyle(.secondary)
                            Text("Oops! No Results")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }, description: {
                        Text("There are no mangas matching: \(viewModel.genreSearch).")
                    }, actions: {
                        Button("Try again") {
                            viewModel.genreSearch = ""
                        }
                    })
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.mangaByGenre.items) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga, frame: 250)
                                        .onAppear {
//                                            if manga.id == viewModel.moreMangas.items.last?.id {
//                                                Task {
//                                                    await viewModel.getMangas()
//                                                }
//                                            }
                                        }
                                    
                                    Text("\(manga.title ?? "")")
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                        .fontWeight(.semibold)
                                }
                                .padding(.bottom)
                                .frame(maxHeight: 285)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("\(viewModel.genreSearch)")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Manga.self) { manga in
                MangaCoverView(manga: manga)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ExploreGenreView()
        .environmentObject(ExploreGenreVM())
}
