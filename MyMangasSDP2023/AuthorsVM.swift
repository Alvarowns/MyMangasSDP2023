//
//  AuthorsListVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 29/1/24.
//

import Foundation

@Observable
final class AuthorsVM: ObservableObject {
    var mangasByAuthor: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
    var mangasByAuthor: MangasList = MangasList(items: [], metadata: Metadata(per: 0, total: 0, page: 0))
}
