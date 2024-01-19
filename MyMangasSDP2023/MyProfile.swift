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
    var nickname: String
    var name: String?
    var surname: String?
    var age: Int?
    var email: URL?
    var bio: String?
    var image: String?
    
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
