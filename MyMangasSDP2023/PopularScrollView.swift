//
//  ForEachAsyncsView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 21/12/23.
//

import SwiftUI

struct PopularScrollView: View {
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
                            .scrollTransition(topLeading: .interactive,
                                              bottomTrailing: .interactive,
                                              axis: .horizontal) { effect, phase in
                                effect
                                    .scaleEffect(1 - abs(phase.value * 0.3))
                                    .opacity(1 - abs(phase.value * 0.8))
                                    .rotation3DEffect(.degrees(phase.value * 25),
                                                      axis: (x: 0, y: 1, z: 0))
                            }
                        }
                        .scrollTargetLayout()
                    }
                }
                .navigationDestination(for: Manga.self) { manga in
                    MangaCoverView(manga: manga)
                }
            }
            .scrollIndicators(.never)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

#Preview {
    PopularScrollView()
        .environmentObject(MangasVM())
}
