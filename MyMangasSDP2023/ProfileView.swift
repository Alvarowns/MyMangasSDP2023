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
    @Environment(\.modelContext) var modelContext
    @Query private var myProfile: [MyProfile]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Button("Logout") {}
                    Spacer()
                    Button("Edit") {
                        viewModel.showEditSheet = true
                    }
                }
                .foregroundStyle(.purple)
                .font(.headline)
                .padding()
                
                Image("\(myProfile.first?.image ?? "avatarDefault")")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(radius: 5, y: 5)
                    .padding(.horizontal)
                    .frame(maxHeight: 200)
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 25)
                            .foregroundStyle(.secondary)
                            .onTapGesture {
                                viewModel.showImageSheet.toggle()
                            }
                    }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Nickname:")
                            .frame(width: 85, alignment: .leading)
                        Text(myProfile.first?.nickname ?? "")
                            .bold()
                    }
                    Divider()
                    HStack {
                        Text("Name:")
                            .frame(width: 85, alignment: .leading)
                        Text(myProfile.first?.name ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Surname:")
                            .frame(width: 85, alignment: .leading)
                        Text(myProfile.first?.surname ?? "")
                    }
                    Divider()
                    HStack {
                        Text("Age:")
                            .frame(width: 85, alignment: .leading)
                        Text("\(myProfile.first?.age ?? 0)")
                    }
                    Divider()
                    HStack {
                        Text("Email:")
                            .frame(width: 85, alignment: .leading)
                        Text(myProfile.first?.email?.absoluteString ?? "")
                    }
                    Divider()
                    VStack {
                        HStack(alignment: .top) {
                            Text("Bio: ")
                                .frame(width: 85, alignment: .leading)
                            Text(myProfile.first?.bio ?? "")
                                .multilineTextAlignment(.leading)
                                .lineLimit(viewModel.isExpanded ? .max : 2)
                        }
                        
                        if !viewModel.bio.isEmpty {
                            Text(viewModel.isExpanded ? "Shrink" : "Expand")
                                .onTapGesture {
                                    viewModel.isExpanded.toggle()
                                }.foregroundStyle(.purple)
                        }
                        
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
        .sheet(isPresented: $viewModel.showEditSheet, content: {
            VStack {
                HStack {
                    Spacer()
                    Spacer()
                    Text("Edit your profile")
                        .font(.headline)
                    Spacer()
                    Button("Save") {
                        saveData()
                        viewModel.showEditSheet = false
                    }
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .padding(.top, 5)
                    .padding(.horizontal)
                }
                
                NavigationStack {
                    Form {
                        TextField("Nickname", text: $viewModel.nickname)
                            .textContentType(.nickname)
                            .textInputAutocapitalization(.never)
                        TextField("Name", text: $viewModel.name)
                            .textContentType(.name)
                        TextField("Surame", text: $viewModel.surname)
                            .textContentType(.familyName)
                        TextField("Age", value: $viewModel.age, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                        TextField("Bio", text: $viewModel.bio)
                    }
                    .autocorrectionDisabled()
                    .formStyle(.grouped)
                    .padding(.horizontal)
                }
                
                Section(header: Text("Select your avatar").font(.headline)) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                        ForEach(1..<9, id: \.self) { appendingNumber in
                            Image("avatar\(appendingNumber)")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .background {
                                    Circle()
                                        .stroke(lineWidth: viewModel.imageSelected == appendingNumber ? 6 : 0)
                                        .foregroundStyle(.pink)
                                }
                                .onTapGesture {
                                    viewModel.image = "avatar\(appendingNumber)"
                                    viewModel.imageSelected = appendingNumber
                                }
                        }
                    }
                    .padding()
                }
            }
            .presentationDetents([.fraction(0.75)])
        })
        .sheet(isPresented: $viewModel.showImageSheet, content: {
            VStack {
                HStack {
                    Spacer()
                    Button("Save") {
                        saveData()
                        viewModel.showImageSheet = false
                    }
                    .font(.headline)
                    .foregroundStyle(.purple)
                    .padding(.top, 5)
                    .padding(.horizontal)
                }
                
                Section(header: Text("Select your avatar").font(.headline)) {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 125))]) {
                            ForEach(1..<9, id: \.self) { appendingNumber in
                                Image("avatar\(appendingNumber)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .background {
                                        Circle()
                                            .stroke(lineWidth: viewModel.imageSelected == appendingNumber ? 6 : 0)
                                            .foregroundStyle(.pink)
                                    }
                                    .onTapGesture {
                                        viewModel.imageSelected = appendingNumber
                                        viewModel.image = "avatar\(appendingNumber)"
                                    }
                            }
                        }
                        .padding()
                    }
                }
            }
            .presentationDetents([.fraction(0.8)])
        })
    }
    
    func saveData() {
        let updateData = MyProfile(nickname: viewModel.nickname, name: viewModel.name, surname: viewModel.surname, age: viewModel.age, email: viewModel.email, bio: viewModel.bio, image: viewModel.image)
        do {
            try modelContext.delete(model: MyProfile.self)
            modelContext.insert(updateData)
        } catch {
            print("Error trying to edit the profile data: \(error)")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileVM())
}
