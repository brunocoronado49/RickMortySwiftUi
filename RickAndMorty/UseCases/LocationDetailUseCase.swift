//
//  LocationDetailUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class LocationDetailUseCase {
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Location, Error> {
        repository.getLocationDetail(id: id)
    }
}
