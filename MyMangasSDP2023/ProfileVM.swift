//
//  ProfileVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/1/24.
//

import Foundation

@Observable
final class ProfileVM: ObservableObject {
    var profile: ProfileModel
    
    init(profile: ProfileModel) {
        self.profile = profile
    }
}
