//
//  MainTabView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 28/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            MyCollectionView()
                .tabItem {
                    Image(systemName: "books.vertical")
                }
            
            BestMangasScroll()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .tint(.purple)
    }
}

#Preview {
    MainTabView()
}
