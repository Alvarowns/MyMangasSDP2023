//
//  ProfileView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 13/1/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isExpanded: Bool = false
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button("Edit") {
                        showSheet = true
                    }
                    .foregroundStyle(.purple)
                    .font(.headline)
                    .padding(.top)
                    .padding(.horizontal)
                }
                Image(.alvs)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(.horizontal)
                    .frame(maxHeight: 200)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name:")
                            .frame(width: 80, alignment: .leading)
                        Text("Álvaro")
                    }
                    Divider()
                    HStack {
                        Text("Surname:")
                            .frame(width: 80, alignment: .leading)
                        Text("Santos")
                    }
                    Divider()
                    HStack {
                        Text("Email:")
                            .frame(width: 80, alignment: .leading)
                        Text("asantosorellana@gmail.com")
                    }
                    Divider()
                    VStack {
                        HStack(alignment: .top) {
                            Text("Bio: ")
                                .frame(width: 80, alignment: .leading)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                .multilineTextAlignment(.leading)
                                .lineLimit(isExpanded ? .max : 2)
                        }
                        
                        Text(isExpanded ? "Shrink" : "Expand")
                            .onTapGesture {
                                isExpanded.toggle()
                            }
                            .foregroundStyle(.purple)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 40)
                    .padding()
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 0)
            }
        }
        .sheet(isPresented: $showSheet, content: {
            
            VStack {
                HStack {
                    Spacer()
                    Button("Save") {
                        showSheet = false
                    }
                    .padding()
                }
                Text("EDIT OPTIONS")
                Spacer()
            }
        })
    }
}

#Preview {
    ProfileView()
}
