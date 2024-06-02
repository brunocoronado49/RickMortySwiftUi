//
//  GetLocationUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class GetLocationUseCase {
    private let repository: LocationRepository
    
    init(repository: LocationRepository = LocationRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Location], Error> {
        repository.getLocation(page: page)
    }
}
