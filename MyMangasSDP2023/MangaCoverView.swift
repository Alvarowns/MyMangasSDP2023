//
//  MangaCoverView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MangaCoverView: View {
    @ObservedObject var viewModel = MangasVM()
    @State var titleJapanese: Bool = false
    @State var synopsis: Bool = true
    
    var manga: Manga
    
    var body: some View {
        VStack {
            Text(titleJapanese ? manga.titleJapanese ?? "" : manga.title ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .padding(10)
            
                Button {
                    titleJapanese.toggle()
                } label: {
                    Text(titleJapanese ? "English" : "Japanese")
                }
                .buttonStyle(.bordered)
            
            ScrollView {
                VStack {
                    if let imageURLTrimmed = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                       let imageURL = URL(string: imageURLTrimmed) {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 500)
                        } placeholder: {
                            Image(.seinenManga)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 200, maxHeight: 285)
                        }
                        
                        VStack {
                            HStack {
                                Button {
                                    synopsis = true
                                } label: {
                                    Text("Synopsis")
                                        .font(.title3)
                                }
                                
                                Button {
                                    synopsis = false
                                } label: {
                                    Text("Info")
                                        .font(.title3)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Text("Add to collection")
                                }
                            }
                            .buttonStyle(.bordered)
                            
                            Text(synopsis ? manga.sypnosis ?? "" : "")
                                .font(.title3)
                            
                            if !synopsis {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Chapters: \(manga.chapters ?? 0)")
                                        Text(" \(manga.startDate ?? "")")
                                        Text(" \(manga.endDate ?? "")")
                                        Text(" \(manga.score ?? 0)")
                                        Text(" \(manga.status ?? "" )")
                                        Text(" \(manga.startDate ?? "")")
                                    }
                                    .font(.title3)
                                    Spacer()
                                }
                            }
                        }
                        
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MangaCoverView(manga: .test)
}
