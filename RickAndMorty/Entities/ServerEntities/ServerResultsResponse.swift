//
//  ServerResultsResponse.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

struct ServerResultsResponse<T: Codable>: Codable {
    let results: T
}
