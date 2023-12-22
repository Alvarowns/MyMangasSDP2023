//
//  ForEachAsyncsView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 21/12/23.
//

import SwiftUI

struct HorizontalScrollView: View {
    @ObservedObject var viewModel = MangasVM()
    
    var body: some View {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.mangas.items) { mangas in
                        if let mainPictureString = mangas.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                           let url = URL(string: mainPictureString) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 200, maxHeight: 200)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                }
            }
            .frame(minWidth: 200, maxWidth: .infinity)
            .scrollIndicators(.hidden)
    }
}

#Preview {
    HorizontalScrollView()
}
