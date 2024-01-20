//
//  CoverViewVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 20/1/24.
//

import Foundation

@Observable
final class MangaCoverViewVM: ObservableObject {
    var network = Network()
    
    var synopsis: Bool = true
    var titleJapanese: Bool = false
    var isSheetPresented: Bool = false
    var isAlertPresented: Bool = false
    var isAlertErrorPresented: Bool = false
    var myCollectionVolumes: Int = 0
    var volumesReaded: Int = 0
}
