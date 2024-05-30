//
//  HTTPError.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

enum HTTPError: LocalizedError, Equatable {
    case invalidResponse
    case invalidStatusCode
}
