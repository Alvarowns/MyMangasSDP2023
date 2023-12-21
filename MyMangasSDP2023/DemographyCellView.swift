//
//  GenreCellView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct DemographyCellView: View {
    @State var genre = ""
    @State var image: ImageResource
    @State var foregroundColor: Color
    
    var body: some View {
            VStack {
                Text(genre)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .offset(x: 0, y: 40)
                    .frame(maxWidth: 175, maxHeight: 110)
                    .clipped()
            }
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(foregroundColor)
                    .frame(width: 175, height: 150)
            }
        }
    
}

#Preview {
    DemographyCellView(genre: "Erotic", image: .eroticManga, foregroundColor: .pink.opacity(0.9))
}
