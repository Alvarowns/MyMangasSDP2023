//
//  ExploreThemeView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 23/1/24.
//

import SwiftUI

struct ExploreThemeView: View {
    @EnvironmentObject private var viewModel: ExploreVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.mangasByTheme.items.isEmpty {
                    ContentUnavailableView {
                        VStack {
                            Image(systemName: "doc.text.magnifyingglass")
                                .font(.custom("size", size: 80))
                                .foregroundStyle(.secondary)
                            Text("Oops! No Results")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    } description: {
                        Text("There are no mangas matching: \(viewModel.themeName).")
                    } actions: {
                        
                    }
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.mangasByTheme.items) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga)
                                        .onAppear {
                                            if manga.id == viewModel.mangasByTheme.items.last?.id {
                                                Task {
                                                    await viewModel.getMangasByTheme(theme: viewModel.themeName)
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
            .navigationTitle("\(viewModel.themeName)")
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
    ExploreThemeView()
}
