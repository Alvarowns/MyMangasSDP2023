//
//  RandomMangaView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct RandomMangaView: View {
    @EnvironmentObject var viewModel: MangasVM
    
    var body: some View {
        NavigationStack {
            let manga = viewModel.randomMangas.items.randomElement()
            NavigationLink(value: manga) {
                VStack {
                    if let mainPictureString = manga?.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                       let imageURL = URL(string: mainPictureString) {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(height: 250)
                        
                        Text(manga?.title ?? "")
                            .titlesMainStyle()
                    }
                }
                .navigationDestination(for: Manga.self) { manga in
                    MangaCoverView(manga: manga)
                }
            }
        }
    }
}

#Preview {
    RandomMangaView()
        .environmentObject(MangasVM())
}
