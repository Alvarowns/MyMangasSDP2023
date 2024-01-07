//
//  MyCollection.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 30/12/23.
//

import Foundation
import SwiftData

@Model
class MyCollection {
    var status: String?
    var volumes: Int?
    var chapters: Int?
    var background: String?
    var titleJapanese: String?
    var endDate: String?
    var sypnosis: String?
    var mainPicture: String?
    var title: String?
    var startDate: String?
    var score: Double?
    var url: String?
    var id: Int
    var titleEnglish: String?
    var volumesInCollection: Int
    var volumesReaded: Int
    var favorite: Bool
    
    init(status: String? = nil, volumes: Int? = nil, chapters: Int? = nil, background: String? = nil, titleJapanese: String? = nil, endDate: String? = nil, sypnosis: String? = nil, mainPicture: String? = nil, title: String? = nil, startDate: String? = nil, score: Double? = nil, url: String? = nil, id: Int, titleEnglish: String? = nil, volumesInCollection: Int, volumesReaded: Int, favorite: Bool = false) {
        self.status = status
        self.volumes = volumes
        self.chapters = chapters
        self.background = background
        self.titleJapanese = titleJapanese
        self.endDate = endDate
        self.sypnosis = sypnosis
        self.mainPicture = mainPicture
        self.title = title
        self.startDate = startDate
        self.score = score
        self.url = url
        self.id = id
        self.titleEnglish = titleEnglish
        self.volumesInCollection = volumesInCollection
        self.volumesReaded = volumesReaded
        self.favorite = favorite
    }
}
