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
    
    var mangaByGenre: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    
    var isGenreSearch: Bool = false
    var genreSearch: String = ""
    
    var deleteAlert = false
    var showAlert = false
    var errorMsg = ""
    
    func getMangaByGenre(genre: String, per: Int) async {
        do {
            let mangas = try await network.getMangaByGenre(genre: genre, per: per)
            await MainActor.run {
                self.mangaByGenre = mangas
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
