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
            
            BestMangasScroll()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            BestMangasScroll()
                .tabItem {
                    Image(systemName: "books.vertical")
                }
            BestMangasScroll()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
