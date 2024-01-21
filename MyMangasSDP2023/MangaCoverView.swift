//
//  MangaCoverView.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 19/12/23.
//

import SwiftUI
import SwiftData

struct MangaCoverView: View {
    @EnvironmentObject var viewModel: MangaCoverViewVM
    @Environment(\.modelContext) var modelContext
    @Query(sort: \MyCollection.title) private var myCollection: [MyCollection]
    
    @State var inCollection = false
    
    let manga: Manga
    
    var body: some View {
        VStack {
            Text(viewModel.titleJapanese ? manga.titleJapanese ?? "" : manga.title ?? "")
                .mainTitle(size: 30)
            
            Button {
                viewModel.titleJapanese.toggle()
            } label: {
                Text(viewModel.titleJapanese ? "English" : "Japanese")
                    .underline()
            }
            .foregroundStyle(.purple)
            .fontWeight(.semibold)
            
            ScrollView {
                VStack {
                    CoverView(manga: manga)
                    
                    InfoDetail(manga: manga, inCollection: $inCollection)
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
        .onAppear {
            if myCollection.contains(where: { $0.id == manga.id}) {
                inCollection = true
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
        .environmentObject(MangaCoverViewVM())
}
