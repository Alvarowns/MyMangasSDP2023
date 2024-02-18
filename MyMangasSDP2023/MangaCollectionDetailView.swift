//
//  MangaCollectionDetailView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 6/1/24.
//

import SwiftUI
import SwiftData

struct MangaCollectionDetailView: View {
    @EnvironmentObject var viewModel: MangaInCollectionDetailVM
    
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
                                    viewModel.volumesCollection -= 1
                                } label: {
                                    Image(systemName: "minus.square.fill")
                                }
                                
                                TextField("Volumes in collection", value: $viewModel.volumesCollection, formatter: NumberFormatter())
                                    .frame(maxWidth: 24)
                                    .keyboardType(.numberPad)
                                
                                Button {
                                    viewModel.volumesCollection += 1
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
                                    viewModel.volumesRead -= 1
                                } label: {
                                    Image(systemName: "minus.square.fill")
                                }
                                
                                TextField("Volumes read", value: $viewModel.volumesRead, formatter: NumberFormatter())
                                    .frame(maxWidth: 24)
                                    .keyboardType(.numberPad)
                                
                                Button {
                                    viewModel.volumesRead += 1
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
                        if manga.collectionCompleted {
                            manga.collectionCompleted = false
                        } else {
                            manga.collectionCompleted = true
                        }
                    } label: {
                        Text("Completed")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(manga.collectionCompleted ? Color.green : Color.gray)
                    
                    Button {
                        if manga.favorite == false {
                            manga.favorite = true
                            viewModel.isFavAlert.toggle()
                        } else {
                            manga.favorite = false
                            viewModel.isNoFavAlert.toggle()
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
                        if viewModel.volumesCollection > manga.volumes ?? 0 || viewModel.volumesRead > manga.volumes ?? 0 {
                            viewModel.errorAlert.toggle()
                        } else {
                            manga.volumesInCollection = viewModel.volumesCollection
                            manga.volumesReaded = viewModel.volumesRead
                            viewModel.isSubmitAlert.toggle()
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
            viewModel.volumesCollection = manga.volumesInCollection
            viewModel.volumesRead = manga.volumesReaded
        }
        .blur(radius: viewModel.isSubmitAlert || viewModel.isFavAlert || viewModel.isNoFavAlert ? 2.0 : 0.0)
        .alert("Changes submitted", isPresented: $viewModel.isSubmitAlert) {}
        .alert("Volumes in collection or read can't be higher than the total volumes", isPresented: $viewModel.errorAlert) {}
        .alert("\(manga.title ?? "") added to Favorites", isPresented: $viewModel.isFavAlert) {}
        .alert("\(manga.title ?? "") removed from Favorites", isPresented: $viewModel.isNoFavAlert) {}
        .task {
            await viewModel.getMangaById(id: manga.id)
        }
    }
}

#Preview {
    MangaCollectionDetailView(manga: .test)
        .environmentObject(MangaInCollectionDetailVM())
}
