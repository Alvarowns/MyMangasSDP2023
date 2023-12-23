//
//  Model.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import Foundation

enum DemographicName: String, Codable, CaseIterable, Identifiable {
    case shounen = "Shounen"
    case shoujo = "Shoujo"
    case seinen = "Seinen"
    case kids = "Kids"
    case josei = "Josei"
    
    var id: Self { self }
}

enum Status: String, Codable, CaseIterable, Identifiable {
    case currentlyPublishing = "currently_publishing"
    case finished = "finished"
    
    var id: Self { self }
}

// Crear extensión para dateFormatted.
extension Date {
}
