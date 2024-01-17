//
//  ProfileView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 13/1/24.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @EnvironmentObject private var viewModel: ProfileVM
    
    @State private var isExpanded: Bool = false
    @State private var showEditSheet: Bool = false
    @State private var showImageSheet: Bool = false
    @State private var image = "avatarDefault"
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button("Logout") {}
                    Spacer()
                    Button("Edit") {
                        showEditSheet = true
                    }
                }
                .foregroundStyle(.purple)
                .font(.headline)
                .padding()
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(.horizontal)
                    .frame(maxHeight: 200)
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25)
                            .foregroundStyle(.secondary)
                            .onTapGesture {
                                showImageSheet.toggle()
                            }
                    }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Nickname:")
                            .frame(width: 85, alignment: .leading)
                        Text(viewModel.profile.nickname)
                            .bold()
                    }
                    Divider()
                    HStack {
                        Text("Name:")
                            .frame(width: 85, alignment: .leading)
                        Text(viewModel.profile.name ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Surname:")
                            .frame(width: 85, alignment: .leading)
                        Text(viewModel.profile.surname ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Age:")
                            .frame(width: 85, alignment: .leading)
                        Text("\(viewModel.profile.age ?? 0)")
                    }
                    Divider()
                    HStack {
                        Text("Email:")
                            .frame(width: 85, alignment: .leading)
                        Text(viewModel.profile.email?.absoluteString ?? "")
                    }
                    Divider()
                    VStack {
                        HStack(alignment: .top) {
                            Text("Bio: ")
                                .frame(width: 85, alignment: .leading)
                            Text(viewModel.profile.bio ?? "")
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
                .padding(.vertical)
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
        .sheet(isPresented: $showEditSheet, content: {
            VStack {
                HStack {
                    Spacer()
                    Button("Save") {
                        showEditSheet = false
                    }
                    .padding()
                }
                Text("EDIT OPTIONS")
                // Aún no está en la base de datos.
                Spacer()
            }
            .presentationDetents([.fraction(0.5)])
        })
        .sheet(isPresented: $showImageSheet, content: {
            VStack {
                HStack {
                    Spacer()
                    Button("Cancel") {
                        showImageSheet = false
                    }
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .padding()
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 125))]) {
                        ForEach(1..<9, id: \.self) { appendingNumber in
                            Image("avatar\(appendingNumber)")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .onTapGesture {
                                    showImageSheet = false
                                    image = "avatar\(appendingNumber)"
                                }
                        }
                    }
                    .padding()
                }
            }
            .presentationDetents([.fraction(0.8)])
        })
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileVM(profile: .test))
}
