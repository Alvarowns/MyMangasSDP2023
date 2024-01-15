//
//  ExploreDemographicView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 13/1/24.
//

import SwiftUI

struct ExploreDemographicView: View {
    @EnvironmentObject private var viewModel: ExploreVM
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.mangasByDemographic.items.isEmpty {
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
                        Text("There are no mangas matching: \(viewModel.demographicName).")
                    }, actions: {})
                    .padding(.top, 200)
                } else {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                        ForEach(viewModel.mangasByDemographic.items) { manga in
                            NavigationLink(value: manga) {
                                VStack {
                                    CoverView(manga: manga)
                                        .onAppear {
                                            if manga.id == viewModel.mangasByDemographic.items.last?.id {
                                                Task {
                                                    await viewModel.getMangasByDemographic(demographic: viewModel.demographicName)
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
            .navigationTitle("\(viewModel.demographicName)")
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
    ExploreDemographicView()
        .environmentObject(ExploreVM())
}
