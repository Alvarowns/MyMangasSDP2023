//
//  Network.swift
//  MyMangasSDP2023
//
//  Created by Alvaro Santos Orellana on 14/12/23.
//

import SwiftUI

protocol DataInteractor {
    func getMangas(page: Int, per: Int) async throws -> MangasList
}

struct Network: DataInteractor {
    
    func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable {
        let (data, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(type, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func postJSON(request: URLRequest, status: Int = 200) async throws {
        let (_, response) = try await URLSession.shared.getData(for: request)
        if response.statusCode != status {
            throw NetworkError.status(response.statusCode)
        }
    }
    
    func getMangas(page: Int, per: Int) async throws -> MangasList {
        try await getJSON(request: .get(url: .getMangas(page: page, per: per)), type: MangasList.self)
    }
    
    func getLastMangas() async throws -> MangasList {
        return try await getJSON(request: .get(url: .getLastMangas(page: 6484, per: 10)), type: MangasList.self)
    }
    
    func getBestMangas() async throws -> MangasList {
        try await getJSON(request: .get(url: .getBestMangas), type: MangasList.self)
    }
    
    func getMangaById(id: Int) async throws -> Manga {
        try await getJSON(request: .get(url: .getMangaById(id: id)), type: Manga.self)
    }
    
    func getRandomMangas() async throws -> MangasList {
        let randomPage = Int.random(in: 1...6484)
        return try await getJSON(request: .get(url: .getRandomMangas(page: randomPage, per: 10)), type: MangasList.self)
    }
    
    func searchContains(contains: String) async throws -> MangasList {
        try await getJSON(request: .get(url: .searchManga(contains: contains)), type: MangasList.self)
    }
}
