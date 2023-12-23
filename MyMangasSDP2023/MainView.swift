//
//  MainView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MangasVM()
    
    var body: some View {
            NavigationStack {
                VStack {
                    HeaderView()
                    SearchBarView()
                    
                    VStack(alignment: .leading) {
                        Text("popular")
                            .font(.custom("LeagueSpartan-SemiBold", size: 30))
                        HorizontalScrollView()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                           Text("last added")
                                .font(.custom("LeagueSpartan-SemiBold", size: 30))
                            if let lastManga = viewModel.mangas.items.last,
                               let urlString = lastManga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                               let url = URL(string: urlString) {
                                NavigationLink(value: lastManga) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .image?.resizable()
                                    }
                                }
                                .navigationDestination(for: Manga.self) { manga in
                                    MangaCoverView(manga: lastManga)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
    }
}


#Preview {
    MainView()
}
