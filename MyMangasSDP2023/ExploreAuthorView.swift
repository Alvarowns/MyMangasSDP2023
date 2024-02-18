//
//  ExploreAuthorView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 23/1/24.
//

import SwiftUI

struct ExploreAuthorView: View {
    @EnvironmentObject private var viewModel: AuthorsVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.mangasByAuthor.items.isEmpty {
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
                        Text("There are no mangas matching: \(viewModel.authorName).")
                    } actions: {
                        
                    }
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.mangasByAuthor.items) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga)
                                        .onAppear {
                                            if manga.id == viewModel.mangasByAuthor.items.last?.id {
                                                Task {
                                                    await viewModel.getMangasByAuthor(id: viewModel.authorId)
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
            .navigationTitle("\(viewModel.authorName)")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Manga.self) { manga in
                MangaCoverView(manga: manga)
            }
        }
        .onDisappear {
            viewModel.page = 1
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ExploreAuthorView()
        .environmentObject(AuthorsVM())
}
