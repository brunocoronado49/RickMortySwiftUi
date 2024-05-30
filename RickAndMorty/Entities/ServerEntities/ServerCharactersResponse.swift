//
//  ServerCharactersResponse.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

struct ServerCharactersResponse: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: ServerOriginResponse?
    let location: ServerLocationResponse?
    let image: String
    let url: String
    let episode: [String]
    
    func convertToEntity() -> Character {
        return Character(id: id, 
                         name: name,
                         status: CharacterStatus(rawValue: status.capitalized) ?? .unknown,
                         species: species,
                         type: type.capitalized,
                         gender: gender.capitalized,
                         origin: origin?.name?.capitalized ?? "",
                         location: location?.name?.capitalized ?? "",
                         image: image,
                         url: url,
                         episode: episode)
    }
}
