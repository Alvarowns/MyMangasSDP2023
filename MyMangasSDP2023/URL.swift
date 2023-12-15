//
//  URL.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 14/12/23.
//

import Foundation

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/")!

extension URL {
    static let getList = api.appending(path: "list/mangas")
    static let getBestMangas = api.appending(path: "list/bestMangas")
    static let getAuthors = api.appending(path: "list/authors")
    static let getDemographic = api.appending(path: "list/demographics")
    static let getGenres = api.appending(path: "list/genres")
    static let getThemes = api.appending(path: "list/themes")
    static let mangaByGenre = api.appending(path: "list/mangaByGenre")
    static let mangaByTheme = api.appending(path: "list/mangaByTheme")
    
    static func getMangaByGenre(genre: String) -> URL {
        api.appending(path: "list/mangaByGenre/").appending(path: "\(genre)")
    }
    
    static func getMangaByTheme(theme: String) -> URL {
        api.appending(path: "list/mangaByTheme/").appending(path: "\(theme)")
    }
    
    static func getMangaByDemography(demography: String) -> URL {
        api.appending(path: "list/mangaByDemographic/").appending(path: "\(demography)")
    }
    
    static func getMangaByAuthor(authorID: String) -> URL {
        api.appending(path: "list/authors/").appending(path: "\(authorID)")
    }
}
