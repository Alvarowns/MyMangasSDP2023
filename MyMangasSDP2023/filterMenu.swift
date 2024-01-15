//
//  GenresMenu.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 8/1/24.
//

import SwiftUI

struct filterMenu: View {
    @EnvironmentObject private var viewModel: ExploreVM
    
    var body: some View {
        Menu {
            Menu {
                ForEach(GenreName.allCases) { genreName in
                        Button {
                            viewModel.genreSearch = genreName.rawValue
                            Task {
                                await viewModel.getMangasByGenre(genre: genreName.rawValue)
                            }
                            viewModel.isGenreSearch.toggle()
                        } label: {
                            viewModel.isGenreSearch ? Image(systemName: "checkmark.square") : Image(systemName: "square")
                            Text(genreName.rawValue)
                        }
                }
            } label: {
                Button("Genres") {}
            }
            
            Menu {
                ForEach(DemographicName.allCases) { demographic in
                        Button {
                            viewModel.demographicName = demographic.rawValue
                            Task {
                                await viewModel.getMangasByDemographic(demographic: demographic.rawValue)
                            }
                            viewModel.isDemographicSearch.toggle()
                        } label: {
                            viewModel.isDemographicSearch ? Image(systemName: "checkmark.square") : Image(systemName: "square")
                            Text(demographic.rawValue)
                        }
                }
            } label: {
                Button("Audience") {}
            }
        } label: {
            Button("Filter") {}
                .buttonStyle(.borderedProminent)
                .tint(.purple.opacity(0.8))
        }
        .padding()
        .menuStyle(.automatic)
        .sheet(isPresented: $viewModel.isGenreSearch, content: {
            ExploreGenreView()
        })
        .sheet(isPresented: $viewModel.isDemographicSearch, content: {
            ExploreDemographicView()
        })
    }
}

#Preview {
    filterMenu()
        .environmentObject(ExploreVM())
}
