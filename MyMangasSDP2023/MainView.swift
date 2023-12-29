//
//  MainView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MangasVM()
    
    var body: some View {
            NavigationStack {
                VStack {
                    HeaderView()
                    SearchBarView()
                    
                    VStack(alignment: .leading) {
                        Text("Popular")
                            .mainTitle(size: 25)
                        BestMangasScroll()
                    }
                    
                    HStack(spacing: 30) {
                        VStack(alignment: .center) {
                           Text("What's new")
                                .mainTitle(size: 25)
                            LastAddedView()
                        }
                        
                        VStack(alignment: .center) {
                           Text("Suggested")
                                .mainTitle(size: 25)
                                .multilineTextAlignment(.center)
                            LastAddedView()
                        }
                    }
                    .padding(.top)
                }
            }
            .padding()
            .ignoresSafeArea()
    }
}


#Preview {
    MainView()
}
