//
//  MangasVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import SwiftUI
import SwiftData

@Observable
final class MangasVM: ObservableObject {
    var network = Network()
    
    var appState: AppState = .splash
    
    var mangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var moreMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var bestMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var lastMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var searchContains: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    
    var search: String = ""
    
    var deleteAlert = false
    var showAlert = false
    var errorMsg = ""
    
    var page: Int = 1
    var per: Int = 20
    
    var filterSearch: [Manga] {
        guard !search.isEmpty else { return moreMangas.items }
        
        Task {
            await searchContains(contains: search)
        }
        
        return searchContains.items
    }
    
    init() {
        Task {
            await getMangas()
            await getLastMangas()
            await getBestMangas()
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
    
    func searchContains(contains: String) async {
        do {
            let mangas = try await network.searchContains(contains: contains)
            await MainActor.run {
                self.searchContains = mangas
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
