//
//  MangaCoverView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI
import SwiftData

struct MangaCoverView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \MyCollection.title) private var myCollection: [MyCollection]
    
    let manga: Manga
    
    @State private var synopsis: Bool = true
    @State private var titleJapanese: Bool = false
    @State var inCollection: Bool = false
    @State var isSheetPresented: Bool = false
    @State var isAlertPresented: Bool = false
    @State var isAlertErrorPresented: Bool = false
    @State var myCollectionVolumes: Int = 0
    @State var volumesReaded: Int = 0
    
    var body: some View {
        let score = String(format: "%.2f", manga.score ?? 0)
        
        VStack {
            Text(titleJapanese ? manga.titleJapanese ?? "" : manga.title ?? "")
                .mainTitle(size: 30)
            
            Button {
                titleJapanese.toggle()
            } label: {
                Text(titleJapanese ? "English" : "Japanese")
                    .underline()
            }
            .foregroundStyle(.purple)
            .fontWeight(.semibold)
            
            ScrollView {
                VStack {
                    CoverView(manga: manga, frame: 500)
                    
                    VStack {
                        HStack(alignment: .center) {
                            if !manga.demographics.isEmpty{
                                ForEach(manga.demographics) { demographic in
                                    DemogTypeView(demographic: demographic.demographic)
                                }
                            } else {
                                Text("")
                            }
                        }
                        
                        HStack {
                            Button {
                                synopsis = true
                            } label: {
                                Text("Synopsis")
                            }
                            .tint(synopsis ? .purple : .purple.opacity(0.6))
                            
                            Button {
                                synopsis = false
                            } label: {
                                Text("Info")
                            }
                            .tint(!synopsis ? .purple : .purple.opacity(0.6))
                            
                            Button {
                                if !inCollection {
                                    isSheetPresented.toggle()
                                }
                            } label: {
                                !inCollection ? Text("+ Add to collection") : Text("Already in collection")
                            }
                            .tint(!inCollection ? .indigo.opacity(1) : .pink.opacity(0.8))
                            .sheet(isPresented: $isSheetPresented) {
                            } content: {
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            let addToCollection = MyCollection(status: manga.status, volumes: manga.volumes, chapters: manga.chapters, background: manga.background, titleJapanese: manga.titleJapanese, endDate: manga.endDate, sypnosis: manga.sypnosis, mainPicture: manga.mainPicture, title: manga.title, startDate: manga.startDate, score: manga.score, url: manga.url, id: manga.id, titleEnglish: manga.titleEnglish, volumesInCollection: myCollectionVolumes, volumesReaded: volumesReaded, favorite: false)
                                            
                                            if addToCollection.volumesInCollection > manga.volumes ?? 0 || addToCollection.volumesReaded > manga.volumes ?? 0 {
                                                isAlertErrorPresented = true
                                            } else {
                                                modelContext.insert(addToCollection)
                                                isAlertPresented.toggle()
                                            }
                                            
                                        } label: {
                                            Text("Save")
                                                .font(.title3)
                                                .fontWeight(.medium)
                                        }
                                        .padding()
                                    }
                                    
                                    VStack {
                                        Text("Do you want to add \(manga.title ?? "") to your collection?")
                                            .fontWeight(.semibold)
                                            .font(.headline)
                                            .multilineTextAlignment(.center)
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 2) {
                                            Text("How many volumes do you own?")
                                                .font(.callout)
                                            TextField("", value: $myCollectionVolumes, formatter: NumberFormatter())
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .frame(width: 35, height: 30)
                                                .keyboardType(.numberPad)
                                            Text("/ \(manga.volumes ?? 0)")
                                            
                                        }
                                        
                                        HStack(spacing: 2) {
                                            Text("How many volumes did you already read?")
                                                .font(.callout)
                                            TextField("", value: $volumesReaded, formatter: NumberFormatter())
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .keyboardType(.numberPad)
                                                .frame(width: 35, height: 30)
                                            Text("/ \(manga.volumes ?? 0)")
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                    Spacer()
                                }
                                .presentationDetents([.fraction(0.4)])
                                .presentationDragIndicator(.visible)
                                .alert("\(manga.title ?? "") has been added to your collection!", isPresented: $isAlertPresented) {
                                    Button("OK", role: .cancel) {
                                        isSheetPresented = false
                                    }
                                }
                                .alert("Volumes in your collection or readed can't be higher than the manga volumes.", isPresented: $isAlertErrorPresented) {
                                    Button("OK", role: .cancel) {
                                        isSheetPresented = false
                                    }
                                }
                            }
                        }
                        .font(.callout)
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
                    }
                    
                    Group {
                        Text(synopsis ? manga.sypnosis ?? "" : "")
                            .font(.body)
                            .padding(.horizontal, 5)
                        
                        Group {
                            if !synopsis {
                                VStack(alignment: .leading) {
                                    HStack {
                                        Text("Score:")
                                        Spacer()
                                        Text(score)
                                            .fontWeight(.medium)
                                    }
                                    if manga.volumes != nil {
                                        Divider()
                                        HStack {
                                            Text("Volumes:")
                                            Spacer()
                                            Text("\(manga.volumes ?? 0)")
                                                .fontWeight(.medium)
                                        }
                                    }
                                    if manga.chapters != nil {
                                        Divider()
                                        HStack {
                                            Text("Chapters:")
                                            Spacer()
                                            Text("\(manga.chapters ?? 0)")
                                                .fontWeight(.medium)
                                        }
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
                                    Divider()
                                    Text("Genres:")
                                    ForEach(manga.genres) { genre in
                                        HStack {
                                            Spacer()
                                            Text(genre.genre.rawValue)
                                                .fontWeight(.medium)
                                        }
                                    }
                                    if manga.startDate != nil {
                                        Divider()
                                        HStack {
                                            Text("Start date:")
                                            Spacer()
                                            Text("\(manga.startDate?.formattedDateString() ?? "")")
                                                .fontWeight(.medium)
                                        }
                                    }
                                    if manga.endDate != nil {
                                        Divider()
                                        HStack {
                                            Text("End date:")
                                            Spacer()
                                            Text("\(manga.endDate?.formattedDateString() ?? "")")
                                                .fontWeight(.medium)
                                        }
                                    }
                                }
                                .font(.body)
                                .padding(.horizontal, 5)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
        
        Spacer()
    }
    
    func deleteManga(_ indexSet: IndexSet) {
        for index in indexSet {
            let manga = myCollection[index]
            modelContext.delete(manga)
        }
    }
}

#Preview {
    MangaCoverView(manga: .test)
}
