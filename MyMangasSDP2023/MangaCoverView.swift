//
//  MangaCoverView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI

struct MangaCoverView: View {
    @State private var titleJapanese: Bool = false
    @State private var synopsis: Bool = true
    
    var manga: Manga
    
    var body: some View {
        let score = String(format: "%.2f", manga.score ?? 0)
        
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
                    if let mainPictureString = manga.mainPicture?.trimmingCharacters(in: .init(charactersIn: "\"")),
                       let imageURL = URL(string: mainPictureString) {
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
                            HStack(alignment: .center) {
                                ForEach(manga.demographics) { demographic in
                                    DemogTypeView(demographic: demographic.demographic)
                                }
                            }
                            
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
                                .tint(.purple)
                            }
                            .buttonStyle(.bordered)
                            .padding(.vertical, 5)
                            
                            Text(synopsis ? manga.sypnosis ?? "" : "")
                                .font(.body)
                                .padding(.horizontal, 5)
                            
                            if !synopsis {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Score:")
                                        Spacer()
                                        Text(score)
                                            .fontWeight(.medium)
                                    }
                                    Divider()
                                    HStack {
                                        Text("Chapters:")
                                        Spacer()
                                        Text("\(manga.chapters ?? 0)")
                                            .fontWeight(.medium)
                                    }
                                    Divider()
                                    HStack {
                                        Text("Status:")
                                        Spacer()
                                        Text("\(manga.status ?? "")")
                                            .fontWeight(.medium)
                                    }
                                    Divider()
                                    Text("Authors:")
                                    ForEach(manga.authors) { author in
                                        HStack {
                                            Spacer()
                                            VStack(alignment: .trailing) {
                                                Text("\(author.firstName ?? "") \(author.lastName ?? "")")
                                                    .fontWeight(.medium)
                                                Text("\(author.role ?? "")")
                                                    .font(.footnote)
                                            }
                                        }
                                    }
                                    Divider()
                                    Text("Themes:")
                                    ForEach(manga.themes) { theme in
                                        HStack {
                                            Spacer()
                                            Text(theme.theme ?? "")
                                                .fontWeight(.medium)
                                        }
                                    }
                                }
                                .font(.body)
                                .padding(.horizontal, 5)
                            }
                        }
                        
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    MangaCoverView(manga: .test)
}
