//
//  AuthorsListVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 29/1/24.
//

import Foundation

@Observable
final class AuthorsVM: ObservableObject {
    var network = Network()
    
    var mangasByAuthor: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var authors: [Manga.Author]? = [Manga.Author(lastName: "", firstName: "", role: "", id: "")]
    
    var isAuthorSearch: Bool = false
    var isAuthorList: Bool = false
    var authorName: String = ""
    var authorId: String = ""
    var search: String = ""
    
    var deleteAlert = false
    var showAlert = false
    var errorMsg = ""
    
    var per = 20
    var page = 1
    
    var filterSearch: [Manga.Author] {
        guard !search.isEmpty else { return authors ?? [] }
        return authors?.filter { $0.firstName!.localizedCaseInsensitiveContains(search) } ?? []
    }
    
    init() {
        Task {
            await getAuthors()
        }
    }
    
    func getAuthors() async {
        do {
            let authors = try await network.getAuthors()
            await MainActor.run {
                self.authors = authors
            }
        } catch {
            await MainActor.run {
                self.errorMsg = "\(error)"
                self.showAlert.toggle()
                print(errorMsg)
            }
        }
    }
    
    func getMangasByAuthor(id: String) async {
        do {
            let mangas = try await network.getMangasByAuthor(id: id, per: per, page: page)
            await MainActor.run {
                if page == 1 {
                    self.mangasByAuthor = mangas
                    page += 1
                } else {
                    self.mangasByAuthor.items.append(contentsOf: mangas.items)
                    page += 1
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
