//
//  CoverView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 3/1/24.
//

import SwiftUI

struct CoverView: View {
    @State var manga: Manga
    var frame: CGFloat
    
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
            .frame(height: frame)
        }
    }
}

#Preview {
    CoverView(manga: .test, frame: 500)
}
