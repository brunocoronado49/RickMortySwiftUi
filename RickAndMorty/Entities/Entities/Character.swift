//
//  Character.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

struct Character: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    var status: CharacterStatus
    let species: String
    let type: String
    let gender: String
    let origin: String
    let location: String
    let image: String
    let url: String
    let episode: [String]
}
