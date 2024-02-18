//
//  ExploreView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewModel: MangasVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.filterSearch.isEmpty {
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
                        Text("There are no mangas matching: \(viewModel.search).")
                    } actions: {
                        Button("Try again") {
                            viewModel.search = ""
                        }
                    }
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.filterSearch) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga)
                                        .onAppear {
                                            if manga.id == viewModel.moreMangas.items.last?.id {
                                                viewModel.page += 1
                                                Task {
                                                    await viewModel.getMangas()
                                                }
                                            }
                                        }
                                    
                                    Text("\(manga.title ?? "")")
                                        .titlesMainStyle()
                                        .lineLimit(1)
                                }
                                .navigationDestination(for: Manga.self) { manga in
                                    MangaCoverView(manga: manga)
                                }
                                .padding(.bottom)
                                .frame(maxHeight: 285)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .searchable(text: $viewModel.search, prompt: "Search Manga")
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                FilterMenu()
            }
        }
        .scrollIndicators(.hidden)
        .onAppear {
            viewModel.page = 1
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(MangasVM())
}
