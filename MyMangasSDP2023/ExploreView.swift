//
//  ExploreView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = MangasVM()
    
    @State private var search = ""
    
    var filterSearch: [Manga] {
        guard !search.isEmpty else { return viewModel.moreMangas.items }
        Task {
            await viewModel.searchContains(contains: search)
        }
        return viewModel.searchContains.items
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                    ForEach(filterSearch) { manga in
                        NavigationLink(value: manga) {
                            VStack {
                                CoverView(manga: manga, frame: 250)
                                    .onAppear {
                                        if manga.title == viewModel.moreMangas.items.last?.title {
                                            Task {
                                                await viewModel.getMangas()
                                            }
                                        }
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
                .navigationDestination(for: Manga.self) { manga in
                    MangaCoverView(manga: manga)
                }
            }
            .padding(.horizontal)
            .searchable(text: $search, prompt: "Search Manga")
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ExploreView()
}
