//
//  ServerGetLocationResponse.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

struct ServerGetLocationResponse: Codable {
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
    
    func convertToEntity() -> Location {
        return Location(id: id,
                        name: name.capitalized,
                        type: type.capitalized,
                        residents: residents,
                        dimension: dimension.capitalized)
    }
}
