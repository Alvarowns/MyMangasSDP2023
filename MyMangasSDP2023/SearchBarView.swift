//
//  SearchBarView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject private var viewModel = MangasVM()
    @State var secureSearch: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray.opacity(0.4))
            TextField("Search Manga", text: $secureSearch)
                .fontWeight(.semibold)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            Spacer()
            Button("Search") {
//                viewModel.search = secureSearch
//                print(viewModel.search)
                print("AÑADE ACCIÓN AQUÍ")
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.purple)
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
    SearchBarView(secureSearch: "")
}
