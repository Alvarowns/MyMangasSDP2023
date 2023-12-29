//
//  SearchBarView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct SearchBarView: View {
    @State var search = ""
    var body: some View {
        HStack {
            TextField("Search", text: $search)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray.opacity(0.4))
        }
        .bold()
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 50)
                .foregroundStyle(.gray.opacity(0.1))
        }
    }
}

#Preview {
    SearchBarView()
}
