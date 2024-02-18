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
                    .shadow(radius: 2, y: 3)
            } placeholder: {
                Image(.mangashelfLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(y: -0.5)
                    .overlay {
                        ProgressView()
                            .offset(y: -25)
                    }
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                    }
                    .padding(.horizontal)
            }
            
        }
    }
}

#Preview {
    CoverView(manga: .test)
}
