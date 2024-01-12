//
//  Model.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import SwiftUI

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

enum GenreName: String, Codable, CaseIterable, Identifiable {
    case action = "Action"
    case adventure = "Adventure"
    case awardWinning = "Award Winning"
    case drama = "Drama"
    case fantasy = "Fantasy"
    case horror = "Horror"
    case supernatural = "Supernatural"
    case mistery = "Mystery"
    case sliceOfLife = "Slice of Life"
    case comedy = "Comedy"
    case sciFi = "Sci-Fi"
    case suspense = "Suspense"
    case sports = "Sports"
    case ecchi = "Ecchi"
    case romance = "Romance"
    case girlsLove = "Girls Love"
    case boysLove = "Boys Love"
    case gourmet = "Gourmet"
    case erotica = "Erotica"
    case hentai = "Hentai"
    case avantGarde = "Avant Garde"
    
    var id: Self { self }
    
}

extension String {
    func formattedDateString() -> String {
        if let date = self.toDateFromISO8601() {
            let dateFormatted = DateFormatter()
            dateFormatted.dateFormat = "dd/MM/yyyy"
            return dateFormatted.string(from: date)
        } else {
            return ""
        }
    }
    
    func toDateFromISO8601() -> Date? {
        return ISO8601DateFormatter().date(from: self)
    }
}

extension Text {
    func mainTitle(size: CGFloat) -> Text {
        return self
            .font(.custom("LeagueSpartan-SemiBold", size: size))
    }
    
    func titlesMainStyle() -> Text {
        return self
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(.textField)
    }
}

extension Bool: Comparable {
    public static func <(lhs: Self, rhs: Self) -> Bool {
        // the only true inequality is false < true
        !lhs && rhs
    }
}
