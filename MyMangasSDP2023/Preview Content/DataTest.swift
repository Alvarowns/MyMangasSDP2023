//
//  DataTest.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 15/12/23.
//

import SwiftUI

extension Manga {
    static let test = Manga(status: "Finished",
                            volumes: 1,
                            chapters: 7,
                            background: nil,
                            titleJapanese: "メイク・ミー・ハッピー",
                            endDate: "2005-01-01T00:00:00Z",
                            sypnosis: "A collection of short stories.\n\nChapter 1, 2, & 3 - Shiba owns a small software firm. Naomi, who works there part-time as he studies at the university, is comfortable with his homosexuality. So, despite Shiba's being 36 years old, Naomi can't help but be attracted to his boss! But, does Shiba feel the same way?\n\nChapter 4: Flower Maze – Hino-san, a disillusioned salaryman, ends his relationship with his male lover to give in to the 'safe' choices of an overseas transfer and arranged marriage. Takashi, a would-be jewelry designer, fights to reclaim their relationship, unwilling to let Hino-san go.\n\nChapter 5 Sleepless & 6 Breathless - After turning 20, Hiroyuki discovers that he has an older step brother, Akira. When Hiroyuki begins to feel attracted to Akira, he isn't sure what to do. What will it take for Hiroyuki to win the affections of his straight and clueless step brother?\n\nChapter 7 Snow Tale - When Hiromu picks up Kouta half frozen in the snow, he never thought it'd lead to a relationship. When a crazy ex-boyfriend shows up, ready to attack, what will happen to the new couple?\n(Source: Liquid Passion)",
                            mainPicture: "https://cdn.myanimelist.net/images/manga/3/4525l.jpg",
                            themes: [
                                Theme(id: "1", theme: "Theme 1"),
                                Theme(id: "2", theme: "Theme 2")
                            ],
                            title: "Make Me Happy",
                            startDate: "2005-01-01T00:00:00Z",
                            demographics: [
                                Demographic(demographic: .josei, id: "1"),
                                Demographic(demographic: .kids, id: "2"),
                                Demographic(demographic: .seinen, id: "3")
                            ],
                            authors: [
                                Author(lastName: "Apellido1", firstName: "Nombre1", role: "Guionista1", id: "ID_DE_PRUEBA"),
                                Author(lastName: "Apellido2", firstName: "Nombre2", role: "Guionista2", id: "ID_DE_PRUEBA2")
                            ],
                            score: 7.13,
                            url: "\"https://myanimelist.net/manga/3930/Make_Me_Happy\"",
                            genres: [
                                Genre(id: "1", genre: GenreName.action),
                                Genre(id: "2", genre: GenreName.adventure),
                                Genre(id: "3", genre: GenreName.comedy)
                            ],
                            id: 3930,
                            titleEnglish: "Make Me Happy")
}

extension MyCollection {
    static let test = MyCollection(status: "Finished",
                            volumes: 1,
                            chapters: 7,
                            background: nil,
                            titleJapanese: "メイク・ミー・ハッピー",
                            endDate: "2005-01-01T00:00:00Z",
                            sypnosis: "A collection of short stories.\n\nChapter 1, 2, & 3 - Shiba owns a small software firm. Naomi, who works there part-time as he studies at the university, is comfortable with his homosexuality. So, despite Shiba's being 36 years old, Naomi can't help but be attracted to his boss! But, does Shiba feel the same way?\n\nChapter 4: Flower Maze – Hino-san, a disillusioned salaryman, ends his relationship with his male lover to give in to the 'safe' choices of an overseas transfer and arranged marriage. Takashi, a would-be jewelry designer, fights to reclaim their relationship, unwilling to let Hino-san go.\n\nChapter 5 Sleepless & 6 Breathless - After turning 20, Hiroyuki discovers that he has an older step brother, Akira. When Hiroyuki begins to feel attracted to Akira, he isn't sure what to do. What will it take for Hiroyuki to win the affections of his straight and clueless step brother?\n\nChapter 7 Snow Tale - When Hiromu picks up Kouta half frozen in the snow, he never thought it'd lead to a relationship. When a crazy ex-boyfriend shows up, ready to attack, what will happen to the new couple?\n(Source: Liquid Passion)",
                            mainPicture: "https://cdn.myanimelist.net/images/manga/3/4525l.jpg",
                            title: "Make Me Happy",
                            startDate: "2005-01-01T00:00:00Z",
                            score: 7.13,
                            url: "\"https://myanimelist.net/manga/3930/Make_Me_Happy\"",
                            id: 3930,
                            titleEnglish: "Make Me Happy",
                            volumesInCollection: 2,
                            volumesReaded: 2,
                            favorite: true)

}

extension ProfileModel {
    static let test = ProfileModel(nickname: "soN1c", name: "Álvaro", surname: "Santos", age: 33, email: URL(string: "asantosorellana@gmail.com"), bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: .avatar1)
}
