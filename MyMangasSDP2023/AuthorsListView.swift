//
//  AUTHORSPRUEBA.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 23/1/24.
//

import SwiftUI

struct AuthorsListView: View {
    @EnvironmentObject private var viewModel: ExploreVM
    var body: some View {
        List {
            ForEach(viewModel.authors) { author in
                Button(author.firstName ?? "") {
                }
            }
        }
    }
}

#Preview {
    AuthorsListView()
        .environmentObject(ExploreVM())
}
