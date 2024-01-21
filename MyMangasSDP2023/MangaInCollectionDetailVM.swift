//
//  MangaInCollectionDetailVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 21/1/24.
//

import Foundation

@Observable
final class MangaInCollectionDetailVM: ObservableObject {
    var network = Network()
    
    var isFavAlert: Bool = false
    var isNoFavAlert: Bool = false
    var isSubmitAlert: Bool = false
    var errorAlert: Bool = false
    var volumesCollection: Int = 0
    var volumesRead: Int = 0
    
    var deleteAlert = false
    var showAlert = false
    var errorMsg = ""
    
    var mangaById: Manga = Manga(status: "", volumes: 0, chapters: 0, background: "", titleJapanese: "", endDate: "", sypnosis: "", mainPicture: "", themes: [Manga.Theme(id: "", theme: "")], title: "", startDate: "", demographics: [Manga.Demographic(demographic: .josei, id: "")], authors: [Manga.Author(lastName: "", firstName: "", role: "", id: "")], score: 0.0, url: "", genres: [Manga.Genre(id: "", genre: GenreName.action)], id: 0, titleEnglish: "")
    
    func getMangaById(id: Int) async {
        do {
            let manga = try await network.getMangaById(id: id)
            await MainActor.run {
                self.mangaById = manga
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
}
