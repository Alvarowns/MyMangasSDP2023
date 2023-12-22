////
////  DTOModel.swift
////  MyMangasSDP2023
////
////  Created by Alvaro Santos Orellana on 15/12/23.
////
//
//import Foundation
//
//struct TopLevel: Codable {
//    let items: [DTOManga]
//    let metadata: Metadata
//}
//
//struct DTOManga: Codable {
//    let titleEnglish: String?
//        let title, url: String
//        let startDate: Date
//        let chapters: Int?
//        let score: Double
//        let id: Int
//        let background: String?
//        let mainPicture: String
//        let endDate: Date?
//        let themes: [Theme]
//        let sypnosis: String?
//        let titleJapanese: String
//        let demographics: [Demographic]
//        let status: Status
//        let genres: [Genre]
//        let volumes: Int?
//        let authors: [Author]
//    
//    struct Theme: Codable {
//        let id: String?
//        let theme: String?
//    }
//    struct Author: Codable {
//        let id: String?
//        let firstName: String?
//        let lastName: String?
//        let role: String?
//    }
//    struct Demographic: Codable {
//        let demographic: DemographicName
//        let id: String?
//    }
//    struct Genre: Codable {
//        let genre: String?
//        let id: String?
//    }
//}
//
//struct Metadata: Codable {
//    let per: Int
//    let total: Int
//    let page: Int
//}
//
//extension DTOManga {
//    var toPresentation: Manga {
//        let convertedAuthors = authors.map { DTOAuthor -> Manga.Author? in
//                    guard let id = DTOAuthor.id,
//                          let firstName = DTOAuthor.firstName,
//                          let lastName = DTOAuthor.lastName,
//                          let role = DTOAuthor.role else {
//                        return nil
//                    }
//                    return Manga.Author(id: id, firstName: firstName, lastName: lastName, role: role)
//                }
//        
//        let convertedThemes = themes.map { DTOTheme -> Manga.Theme? in
//                    guard let id = DTOTheme.id,
//                          let theme = DTOTheme.theme else {
//                        return nil
//                    }
//                    return Manga.Theme(id: id, theme: theme)
//                }
//        
//        let convertedGenres = genres.map { DTOGenre -> Manga.Genre? in
//                    guard let id = DTOGenre.id,
//                          let genre = DTOGenre.genre else {
//                        return nil
//                    }
//                    return Manga.Genre(genre: genre, id: id)
//                }
//        
//        return Manga(titleJapanese: titleJapanese,
//              authors: convertedAuthors,
//              themes: convertedThemes,
//              title: title,
//              id: id,
//              endDate: endDate,
//              score: score,
//              status: status,
//              demographics: demographics,
//              genres: convertedGenres,
//              startDate: startDate,
//              titleEnglish: titleEnglish,
//              chapters: chapters,
//              mainPicture: URL(string: mainPicture ?? ""),
//              synopsis: synopsis,
//              background: background,
//              url: URL(string: url),
//              volumes: volumes)
//    }
//}
