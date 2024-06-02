//
//  LocationRepository.swift
//  RickAndMorty
//
//  Created by Bruno  on 30/05/24.
//

import Foundation
import Combine

protocol LocationRepository {
    func getLocation(page: Int) -> AnyPublisher<[Location], Error>
    func getLocationDetail(id: Int) -> AnyPublisher<Location, Error>
}
