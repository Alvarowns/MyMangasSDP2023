//
//  GenresMenu.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 8/1/24.
//

import SwiftUI

struct filterMenu: View {
    @EnvironmentObject private var viewModel: ExploreGenreVM
    
    var body: some View {
        Menu {
            ForEach(GenreName.allCases) { genreName in
                    Button {
                        viewModel.genreSearch = genreName.rawValue
                        Task {
                            await viewModel.getMangaByGenre(genre: genreName.rawValue, per:20)
                        }
                        viewModel.isGenreSearch.toggle()
                    } label: {
                        viewModel.isGenreSearch ? Image(systemName: "checkmark.square") : Image(systemName: "square")
                        Text(genreName.rawValue)
                    }
            }
            
        } label: {
            Button(viewModel.isGenreSearch ? "\(viewModel.genreSearch)" : "Filter") {}
                .buttonStyle(.borderedProminent)
                .tint(viewModel.isGenreSearch ? .purple : .gray.opacity(0.8))
        }
        .padding()
        .menuStyle(.automatic)
        .sheet(isPresented: $viewModel.isGenreSearch, content: {
            ExploreGenreView()
        })
    }
}

#Preview {
    filterMenu()
        .environmentObject(ExploreGenreVM())
}
