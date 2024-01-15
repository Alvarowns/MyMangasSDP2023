//
//  CoverView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct CoverView: View {
    @State var manga: Manga
    
    
    var body: some View {
        if let mainPictureString = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
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
            
        }
    }
}

#Preview {
    CoverView(manga: .test)
}
