//
//  ProfileVM.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 17/1/24.
//

import Foundation

@Observable
final class ProfileVM: ObservableObject {
    var nickname: String = ""
    var name: String = ""
    var surname: String = ""
    var age: Int = 0
    var email: URL? = URL(string: "")
    var bio: String = ""
    var image: String = "avatarDefault"
}
