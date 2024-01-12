//
//  MangaCollectionDetailView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 6/1/24.
//

import SwiftUI
import SwiftData

struct MangaCollectionDetailView: View {
    @EnvironmentObject var viewModel: MangasVM
    
    @State private var isFavAlert: Bool = false
    @State private var isNoFavAlert: Bool = false
    @State private var isSubmitAlert: Bool = false
    @State private var errorAlert: Bool = false
    @State private var volumesCollection: Int = 0
    @State private var volumesRead: Int = 0
    
    let manga: MyCollection
    
    var body: some View {
        ZStack {
            if let image = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
               let imageURL = URL(string: image) {
                AsyncImage(url: imageURL) { image in
                    image.image?
                        .resizable()
                        .scaledToFill()
                        .opacity(0.15)
                        .offset(x: -50)
                        .ignoresSafeArea()
                }
            }
            
            VStack(spacing: 30) {
                Text("Edit Manga in Collection")
                    .font(.largeTitle)
                    .padding()
                
                VStack(spacing: 20) {
                        Text(manga.title ?? "")
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        VStack {
                            Text("Volumes in collection: ")
                            
                            HStack {
                                Button {
                                    volumesCollection -= 1
                                } label: {
                                    Image(systemName: "minus.square.fill")
                                }
                                
                                TextField("Volumes in collection", value: $volumesCollection, formatter: NumberFormatter())
                                    .frame(maxWidth: 24)
                                    .keyboardType(.numberPad)
                                
                                Button {
                                    volumesCollection += 1
                                } label: {
                                    Image(systemName: "plus.square.fill")
                                }
                                
                                Text("/ \(manga.volumes ?? 0)")
                            }
                        }
                        .font(.title3)
                        
                        VStack {
                            Text("Volumes read: ")
                            
                            HStack {
                                Button {
                                    volumesRead -= 1
                                } label: {
                                    Image(systemName: "minus.square.fill")
                                }
                                
                                TextField("Volumes read", value: $volumesRead, formatter: NumberFormatter())
                                    .frame(maxWidth: 24)
                                    .keyboardType(.numberPad)
                                
                                Button {
                                    volumesRead += 1
                                } label: {
                                    Image(systemName: "plus.square.fill")
                                }
                                
                                Text("/ \(manga.volumes ?? 0)")
                            }
                        }
                        .font(.title3)
                    }
                    .padding(.horizontal)
                    .padding(.top)
                
                VStack(spacing: 20) {
                    Button {
                        if manga.favorite == false {
                            manga.favorite = true
                            isFavAlert.toggle()
                        } else {
                            manga.favorite = false
                            isNoFavAlert.toggle()
                        }
                    } label: {
                        if manga.favorite {
                            HStack {
                                Text("Remove favorite")
                                Image(systemName: "star.slash")
                            }
                        } else {
                            HStack {
                                Text("Mark as favorite")
                                Image(systemName: "star")
                            }
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(!manga.favorite ? .yellow : .red)
                    .foregroundStyle(!manga.favorite ? .black : .white)
                    
                    Button {
                        if volumesCollection > manga.volumes ?? 0 || volumesRead > manga.volumes ?? 0 {
                            errorAlert.toggle()
                        } else {
                            manga.volumesInCollection = volumesCollection
                            manga.volumesReaded = volumesRead
                            isSubmitAlert.toggle()
                        }
                    } label: {
                        Text("Save changes")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    
                    NavigationLink("View manga details", destination: MangaCoverView(manga: viewModel.mangaById))
                        .fontWeight(.medium)
                }
                .font(.title3)
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top)
        }
        .onAppear {
            volumesCollection = manga.volumesInCollection
            volumesRead = manga.volumesReaded
        }
        .alert("Changes submitted", isPresented: $isSubmitAlert) {}
        .alert("Volumes in collection or read can't be higher than the total volumes", isPresented: $errorAlert) {}
        .alert("\(manga.title ?? "") added to Favorites", isPresented: $isFavAlert) {}
        .alert("\(manga.title ?? "") removed from Favorites", isPresented: $isNoFavAlert) {}
        .task {
            await viewModel.getMangaById(id: manga.id)
        }
    }
}

#Preview {
    MangaCollectionDetailView(manga: .test)
        .environmentObject(MangasVM())
}
