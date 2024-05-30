//
//  Location.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

struct Location: Identifiable, Equatable {
    let id: Int
    let name: String
    let type: String
    let residents: [String]
    let dimension: String
}
