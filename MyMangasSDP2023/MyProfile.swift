//
//  ProfileModel.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/1/24.
//

import Foundation
import SwiftData

@Model
class MyProfile {
    let nickname: String
    let name: String?
    let surname: String?
    let age: Int?
    let email: URL?
    let bio: String?
    let image: String?
    
    init(nickname: String, name: String?, surname: String?, age: Int?, email: URL?, bio: String?, image: String?) {
        self.nickname = nickname
        self.name = name
        self.surname = surname
        self.age = age
        self.email = email
        self.bio = bio
        self.image = image
    }
}
