//
//  MainView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MangasVM()
    
    var body: some View {
            NavigationStack {
                VStack(alignment: .leading) {
                    HeaderView(avatar: .alvs)
                    
                    VStack(alignment: .leading) {
                        Text("Popular")
                            .mainTitle(size: 30)
                        BestMangasScroll()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        VStack(alignment: .center) {
                           Text("What's new")
                                .mainTitle(size: 30)
                                .multilineTextAlignment(.center)
                            LastAddedView()
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                           Text("Suggested")
                                .mainTitle(size: 30)
                                .multilineTextAlignment(.center)
                            RandomMangaView()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
            }
            .ignoresSafeArea()
    }
}


#Preview {
    MainView()
}
