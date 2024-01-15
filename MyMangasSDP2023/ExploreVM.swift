//
//  ExploreGenreVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 12/1/24.
//

import Foundation

@Observable
final class ExploreVM: ObservableObject {
    var network = Network()
    
    var mangasByGenre: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var mangasByDemographic: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    
    var isGenreSearch: Bool = false
    var isDemographicSearch: Bool = false
    var genreSearch: String = ""
    var demographicName: String = ""
    
    var deleteAlert = false
    var showAlert = false
    var errorMsg = ""
    
    var per = 20
    var page = 1
    
    func getMangasByGenre(genre: String) async {
        do {
            let mangas = try await network.getMangasByGenre(genre: genre, per: per, page: page)
            await MainActor.run {
                if page == 1 {
                    self.mangasByGenre = mangas
                    page += 1
                } else {
                    self.mangasByGenre.items.append(contentsOf: mangas.items)
                }
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
    func getMangasByDemographic(demographic: String) async {
        do {
            let mangas = try await network.getMangasByDemographic(demographic: demographic, per: per, page: page)
            await MainActor.run {
                if page == 1 {
                    self.mangasByDemographic = mangas
                    page += 1
                } else {
                    self.mangasByDemographic.items.append(contentsOf: mangas.items)
                }
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
