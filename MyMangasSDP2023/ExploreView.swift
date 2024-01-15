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
                        Text("There are no mangas matching: \(viewModel.search).")
                    }, actions: {
                        Button("Try again") {
                            viewModel.search = ""
                        }
                    })
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.filterSearch) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga)
                                        .onAppear {
                                            if manga.id == viewModel.moreMangas.items.last?.id {
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
                }
            }
            .padding(.horizontal)
            .searchable(text: $viewModel.search, prompt: "Search Manga")
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                filterMenu()
            }
            .navigationDestination(for: Manga.self) { manga in
                MangaCoverView(manga: manga)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ExploreView()
        .environmentObject(MangasVM())
}
