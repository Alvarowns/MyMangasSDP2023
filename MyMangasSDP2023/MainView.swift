//
//  MainView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MangasVM()
    
    var body: some View {
        
            NavigationStack {
                VStack {
                    HeaderView()
                    SearchBarView()
                    
                    VStack(alignment: .leading) {
                        Text("Popular")
                            .font(.title)
                            .fontWeight(.semibold)
                        HorizontalScrollView()
                    }                    
                }
            }
            .padding()
    }
}


#Preview {
    MainView()
}
