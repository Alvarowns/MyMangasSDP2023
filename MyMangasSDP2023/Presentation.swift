//
//  DTOModel.swift
//  Presentation
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import Foundation

struct MangasList: Codable {
    let items: [Manga]
    let metadata: Metadata
}

struct Manga: Codable, Identifiable, Hashable {
    let status: String?
    let volumes: Int?
    let chapters: Int?
    let background: String?
    let titleJapanese: String?
    let endDate: String?
    let sypnosis: String?
    let mainPicture: String?
    let themes: [Theme]
    let title: String?
    let startDate: String?
    let demographics: [Demographic]
    let authors: [Author]
    let score: Double?
    let url: String?
    let genres: [Genre]
    let id: Int
    let titleEnglish: String?
    
    struct Theme: Codable, Hashable, Identifiable {
        let id: String?
        let theme: String?
    }
    struct Author: Codable, Hashable, Identifiable {
        let lastName: String?
        let firstName: String?
        let role: String?
        let id: String?
    }
    struct Demographic: Codable, Hashable, Identifiable {
        let demographic: DemographicName
        let id: String?
    }
    struct Genre: Codable, Hashable, Identifiable {
        let id: String?
        let genre: String?
    }
}

struct Metadata: Codable {
    let per: Int
    let total: Int
    let page: Int
}
