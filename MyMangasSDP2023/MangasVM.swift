//
//  MangasVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import SwiftUI
import SwiftData

final class MangasVM: ObservableObject {
    var network = Network()
    
    var appState: AppState = .splash
    
    @Published var mangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    @Published var moreMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    @Published var bestMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    @Published var lastMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    @Published var randomMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    @Published var searchContains: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    @Published var mangaById: Manga = Manga(status: "", volumes: 0, chapters: 0, background: "", titleJapanese: "", endDate: "", sypnosis: "", mainPicture: "", themes: [Manga.Theme(id: "", theme: "")], title: "", startDate: "", demographics: [Manga.Demographic(demographic: .josei, id: "")], authors: [Manga.Author(lastName: "", firstName: "", role: "", id: "")], score: 0.0, url: "", genres: [Manga.Genre(id: "", genre: GenreName.action)], id: 0, titleEnglish: "")
    
    
    @Published var deleteAlert = false
    @Published var showAlert = false
    @Published var errorMsg = ""
    
    @Published var page: Int = 1
    @Published var per: Int = 20
    
    init() {
        Task {
            await getMangas()
            await getLastMangas()
            await getBestMangas()
            await getRandomMangas()
        }
    }
    
    func getMangas() async {
        do {
            let mangas = try await network.getMangas(page: page, per: per)
            await MainActor.run {
                self.mangas = mangas
                self.moreMangas.items.append(contentsOf: mangas.items)
                self.page += 1
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
    func getBestMangas() async {
        do {
            let mangas = try await network.getBestMangas()
            await MainActor.run {
                self.bestMangas = mangas
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
    func getLastMangas() async {
        do {
            let mangas = try await network.getLastMangas()
            await MainActor.run {
                self.lastMangas = mangas
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
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
    
    func getRandomMangas() async {
        do {
            let mangas = try await network.getRandomMangas()
            await MainActor.run {
                self.randomMangas = mangas
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
    func searchContains(contains: String) async {
        do {
            let manga = try await network.searchContains(contains: contains)
            await MainActor.run {
                self.searchContains = manga
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
