//
//  HeaderView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 20/12/23.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("mangashelf")
                    .mainTitle(size: 30)
                
                Spacer()
                
                Menu {
                    Button {
                        
                    } label: {
                        Text("Action 1")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Action 2")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Action 3")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Action 4")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Action 5")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Action 6")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Action 7")
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .bold()
                        .font(.title2)
                }
                .menuOrder(.fixed)
                .menuIndicator(.visible)
            }
            .foregroundStyle(.purple)
        }
    }
}

#Preview {
    HeaderView()
}
