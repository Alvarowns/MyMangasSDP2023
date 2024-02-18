//
//  MyCollectionView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 30/12/23.
//

import SwiftUI
import SwiftData

struct MyCollectionView: View {
    @EnvironmentObject private var viewModel: MangasVM
    @Environment(\.modelContext) var modelContext
    @Query(sort: \MyCollection.favorite, order: .reverse) private var myCollection: [MyCollection]
    
    @State private var search = ""
    
    var filterSearch: [MyCollection] {
        guard !search.isEmpty else { return myCollection }
        return myCollection.filter { $0.title!.localizedCaseInsensitiveContains(search) }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if myCollection.isEmpty {
                    ContentUnavailableView {
                        VStack {
                            Image(systemName: "heart.slash")
                                .font(.custom("size", size: 80))
                                .foregroundStyle(.secondary)
                            Text("Empty Collection")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    } description: {
                        Text("Start adding mangas to your collection!")
                    } actions: {
                        Button("Explore some mangas") {
                            viewModel.sheetPresented.toggle()
                        }
                    }
                } else {
                    List {
                        ForEach(filterSearch) { manga in
                            NavigationLink(value: manga) {
                                if let urlString = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                                   let url = URL(string: urlString) {
                                    HStack {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(maxHeight: 80)
                                        } placeholder: {
                                            Image(systemName: "photo")
                                        }
                                        
                                        Spacer()
                                        
                                        VStack(spacing: 20) {
                                            Text(manga.title ?? "")
                                                .font(.headline)
                                                .multilineTextAlignment(.center)
                                            HStack {
                                                Spacer()
                                                VStack(alignment: .center, spacing: 8) {
                                                    Text("Volumes: \(manga.volumesInCollection)/\(manga.volumes ?? 0)")
                                                    
                                                    Text(manga.collectionCompleted ? "Completed" : "Incomplete")
                                                        .foregroundStyle(manga.collectionCompleted ? Color.green : Color.red)
                                                        .fontWeight(.medium)
                                                }
                                                
                                                Spacer()
                                                
                                                VStack(alignment: .center, spacing: 8) {
                                                    Text("Read:")
                                                    Text("\(manga.volumesReaded)/\(manga.volumes ?? 0)")
                                                        .foregroundStyle(manga.volumesReaded == manga.volumes ?? 0 ? Color.green : Color.secondary)
                                                        .fontWeight(.medium)
                                                }
                                                Spacer()
                                            }
                                        }
                                        
                                        Image(systemName: manga.favorite ? "star.fill" : "star")
                                            .foregroundStyle(.yellow)
                                            .font(.title3)
                                    }
                                    .font(.subheadline)
                                }
                            }
                        }
                        .onDelete(perform: deleteManga(_:))
                        .padding(.vertical, -20)
                    }
                }
            }
            .searchable(text: $search)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .navigationTitle("My Collection")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: MyCollection.self) { manga in
                MangaCollectionDetailView(manga: manga)
            }
            .sheet(isPresented: $viewModel.sheetPresented) {
                ExploreView()
            }
        }
    }
    
    func deleteManga(_ indexSet: IndexSet) {
        for index in indexSet {
            let manga = myCollection[index]
            modelContext.delete(manga)
        }
    }
    
}

#Preview {
    MyCollectionView()
        .environmentObject(MangasVM())
}
