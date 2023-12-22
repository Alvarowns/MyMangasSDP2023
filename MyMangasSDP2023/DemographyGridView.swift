//
//  DemographyGridView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct DemographyGridView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                DemographyCellView(demography: "Josei", image: .joseiManga, foregroundColor: .pink.opacity(0.8),offset: 50)
                DemographyCellView(demography: "Shoujo", image: .shoujoManga, foregroundColor: .green.opacity(0.8),offset: 60)
                DemographyCellView(demography: "Shounen", image: .shounenManga, foregroundColor: .red.opacity(1),offset: 130)
                DemographyCellView(demography: "Seinen", image: .seinenManga, foregroundColor: .black.opacity(0.8),offset: 10)
                DemographyCellView(demography: "Josei", image: .joseiManga, foregroundColor: .orange.opacity(0.8),offset: 50)
            }
        }
    }
}

#Preview {
    DemographyGridView()
}
