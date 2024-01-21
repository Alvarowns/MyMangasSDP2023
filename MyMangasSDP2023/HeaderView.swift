//
//  HeaderView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 20/12/23.
//

import SwiftUI
import SwiftData

struct HeaderView: View {
    @EnvironmentObject private var viewModel: ProfileVM
    @Environment(\.modelContext) var modelContext
    @Query private var myProfile: [MyProfile]
    
    var body: some View {
        VStack {
            HStack {
                Text("mangashelf")
                    .mainTitle(size: 40)
                
                Spacer()
                
                Image(myProfile.first?.image ?? "avatarDefault")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .frame(maxWidth: 40)
            }
            .foregroundStyle(.purple)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HeaderView()
        .environmentObject(ProfileVM())
}
