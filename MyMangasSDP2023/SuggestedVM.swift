//
//  SuggestedVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 20/1/24.
//

import Foundation

@Observable
final class SuggestedVM: ObservableObject {
    var network = Network()
    var randomMangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    
    var deleteAlert = false
    var showAlert = false
    var errorMsg = ""
    
    init() {
        Task {
            await getRandomMangas()
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
}
