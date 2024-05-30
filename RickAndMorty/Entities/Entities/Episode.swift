//
//  Episode.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

struct Episode: Identifiable, Equatable {
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
}
