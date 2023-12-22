//
//  HeaderView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 20/12/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("mangashelf")
                .font(.custom("LeagueSpartan-SemiBold", size: 30))
            
            Spacer()
            
            Menu {
                Button {
                    
                } label: {
                    Text("Button1")
                }
                
                Button {
                    
                } label: {
                    Text("Button2")
                }
                
                Button {
                    
                } label: {
                    Text("Button3")
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .bold()
                    .font(.title2)
            }
            .menuStyle(.automatic)
            .menuOrder(.fixed)
        }
        .foregroundStyle(.purple)
    }
}

#Preview {
    HeaderView()
}
