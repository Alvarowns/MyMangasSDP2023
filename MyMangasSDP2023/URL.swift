//
//  URL.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 14/12/23.
//

import Foundation

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/")!

extension URL {
    static let getBestMangas = api.appending(path: "list/bestMangas")
    static let getAuthors = api.appending(path: "list/authors")
    static let getDemographic = api.appending(path: "list/demographics")
    static let getGenres = api.appending(path: "list/genres")
    static let getThemes = api.appending(path: "list/themes")
    static let mangaByGenre = api.appending(path: "list/mangaByGenre/")
    static let mangaByTheme = api.appending(path: "list/mangaByTheme/")
    static let mangaByDemographic = api.appending(path: "list/mangaByDemographic/")
    static let mangaByAuthor = api.appending(path: "list/mangaByAuthor/")
    static let mangaById = api.appending(path: "search/manga/")
    static let containsSearch = api.appending(path: "search/mangasContains/")
    
    static func getMangas(page: Int, per: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return api.appending(path: "list/mangas").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getRandomMangas(page: Int, per: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return api.appending(path: "list/mangas").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getLastMangas(page: Int, per: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return api.appending(path: "list/mangas").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getMangaByGenre(genre: String, per: Int) -> URL {
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return mangaByGenre.appending(path: "\(genre)").appending(queryItems: [perQueryItem])
    }
    
    static func getMangaByTheme(theme: String) -> URL {
        mangaByTheme.appending(path: "\(theme)")
    }
    
    static func getMangaByDemographic(demography: String) -> URL {
        mangaByDemographic.appending(path: "\(demography)")
    }
    
    static func getMangaByAuthor(id: String) -> URL {
        mangaByAuthor.appending(path: "\(id)")
    }
    
    static func getMangaById(id: Int) -> URL {
        mangaById.appending(path: "\(id)")
    }
    
    static func searchManga(contains: String) -> URL {
        containsSearch.appending(path: "\(contains)")
    }
}
