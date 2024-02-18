//
//  URL.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 14/12/23.
//

import Foundation

let api = URL(string: "https://mymanga-acacademy-5607149ebe3d.herokuapp.com/")!

extension URL {
    static let bestMangas = api.appending(path: "list/bestMangas")
    static let getAuthors = api.appending(path: "list/authors")
    static let getDemographic = api.appending(path: "list/demographics")
    static let getGenres = api.appending(path: "list/genres")
    static let getThemes = api.appending(path: "list/themes")
    static let mangasByGenre = api.appending(path: "list/mangaByGenre/")
    static let mangasByTheme = api.appending(path: "list/mangaByTheme/")
    static let mangasByDemographic = api.appending(path: "list/mangaByDemographic/")
    static let mangasByAuthor = api.appending(path: "list/mangaByAuthor/")
    static let mangaById = api.appending(path: "search/manga/")
    static let containsSearch = api.appending(path: "search/mangasContains/")
    
    static func getMangas(page: Int, per: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return api.appending(path: "list/mangas").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getBestMangas(page: Int, per: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return api.appending(path: "list/bestMangas").appending(queryItems: [pageQueryItem, perQueryItem])
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
    
    static func getMangasByGenre(genre: String, per: Int, page: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return mangasByGenre.appending(path: "\(genre)").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getMangasByTheme(theme: String, per: Int, page: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return mangasByTheme.appending(path: "\(theme)").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getMangasByDemographic(demography: String, per: Int, page: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return mangasByDemographic.appending(path: "\(demography)").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getMangasByAuthor(id: String, per: Int, page: Int) -> URL {
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        let perQueryItem = URLQueryItem(name: "per", value: "\(per)")
        
        return mangasByAuthor.appending(path: "\(id)").appending(queryItems: [pageQueryItem, perQueryItem])
    }
    
    static func getMangasById(id: Int) -> URL {
        mangaById.appending(path: "\(id)")
    }
    
    static func searchManga(contains: String) -> URL {
        containsSearch.appending(path: "\(contains)")
    }
}
