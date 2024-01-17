//
//  ForEachAsyncsView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 21/12/23.
//

import SwiftUI

struct BestMangasScroll: View {
    @EnvironmentObject var viewModel: MangasVM
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.bestMangas.items) { manga in
                        NavigationLink(value: manga) {
                            VStack {
                                CoverView(manga: manga)
                                Text(manga.title ?? "")
                                    .titlesMainStyle()
                                    .frame(width: 125)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
                .navigationDestination(for: Manga.self) { manga in
                    MangaCoverView(manga: manga)
                }
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    BestMangasScroll()
        .environmentObject(MangasVM())
}
