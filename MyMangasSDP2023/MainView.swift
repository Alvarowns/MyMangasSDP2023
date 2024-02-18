//
//  MainView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MangasVM
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HeaderView()
                
                VStack(alignment: .leading) {
                    Text("Popular")
                        .mainTitle(size: 35)
                    PopularScrollView()
                }
                .safeAreaPadding(.horizontal)
                
                HStack {
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
                .padding(.vertical, 5)
                
                HStack {
                    VStack(alignment: .center) {
                        Text("What's new")
                            .mainTitle(size: 30)
                        LastAddedView()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text("Suggested")
                            .mainTitle(size: 30)
                        SuggestedView()
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}


#Preview {
    MainView()
        .environmentObject(MangasVM())
}
