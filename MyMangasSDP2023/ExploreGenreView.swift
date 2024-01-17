//
//  ExploreGenreView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 12/1/24.
//

import SwiftUI

struct ExploreGenreView: View {
    @EnvironmentObject private var viewModel: ExploreVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.mangasByGenre.items.isEmpty {
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
                    }, actions: {})
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.mangasByGenre.items) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga)
                                        .onAppear {
                                            if manga.id == viewModel.mangasByGenre.items.last?.id {
                                                Task {
                                                    await viewModel.getMangasByGenre(genre: viewModel.genreSearch)
                                                }
                                            }
                                        }
                                    
                                    Text("\(manga.title ?? "")")
                                        .titlesMainStyle()
                                        .lineLimit(1)
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
        .onDisappear{
            viewModel.page = 1
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ExploreGenreView()
        .environmentObject(ExploreVM())
}
