//
//  HeaderView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 20/12/23.
//

import SwiftUI

struct HeaderView: View {
    let avatar: ImageResource
    
    var body: some View {
        VStack {
            HStack {
                Text("mangashelf")
                    .mainTitle(size: 40)
                
                Spacer()
                
                Image(avatar)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .frame(maxWidth: 40)
            }
            .foregroundStyle(.purple)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderView(avatar: .alvs)
}
