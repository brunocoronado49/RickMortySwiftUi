//
//  LocationRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Bruno  on 30/05/24.
//

import Foundation
import Combine

class LocationRepositoryImpl: LocationRepository {
    private let remoteDataSource: LocationRemoteDataSource
    
    init(remoteDataSource: LocationRemoteDataSource = LocationRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getLocation(page: Int) -> AnyPublisher<[Location], any Error> {
        return remoteDataSource.getLocation(page: page).map { serverLocation -> [Location] in
            var locations: [Location] = []
            
            for serverLocation in serverLocation.results {
                let location = serverLocation.convertToEntity()
                locations.append(location)
            }
            
            return locations
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
    
    func getLocationDetail(id: Int) -> AnyPublisher<Location, any Error> {
        return remoteDataSource.getLocationDetail(id: id).map { serverLocation -> Location in
            let location = serverLocation.results.convertToEntity()
            
            return location
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
        
}
