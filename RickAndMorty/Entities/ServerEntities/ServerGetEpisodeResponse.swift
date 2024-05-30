//
//  ServerGetEpisodeResponse.swift
//  RickAndMorty
//
//  Created by Bruno  on 30/05/24.
//

import Foundation

struct ServerGetEpisodeResponse: Codable {
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
    
    func convertToEntity() -> Episode {
        return Episode(id: id,
                       name: name.capitalized,
                       episode: episode,
                       airDate: airDate,
                       characters: characters)
    }
}
