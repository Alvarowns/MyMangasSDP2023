//
//  MangasVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import Foundation

final class MangasVM: ObservableObject {
    let network = Network()
    
    @Published var mangas: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    
    @Published var deleteAlert = false
    @Published var showAlert = false
    @Published var msg = ""
    
    init() {
        Task { await getMangas() }
    }
    
    func getMangas() async {
        do {
            let mangas = try await network.getMangas()
            await MainActor.run {
                self.mangas = mangas
            }
        } catch {
            await MainActor.run {
                self.msg = "\(error)"
                self.showAlert.toggle()
                print(msg)
            }
        }
    }
}
