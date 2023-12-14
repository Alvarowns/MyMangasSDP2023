//
//  Item.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 14/12/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
