//
//  EpisodeRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Bruno  on 29/05/24.
//

import Foundation
import Combine

class EpisodeRepositoryImpl: EpisodeRepository {
    private let remoteDataSource: EpisodeRemoteDataSource
    
    init(remoteDataSource: EpisodeRemoteDataSource = EpisodeRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getEpisode(page: Int) -> AnyPublisher<[Episode], any Error> {
        return remoteDataSource.getEpisode(page: page).map { serverEpisode -> [Episode] in
            var episodes: [Episode] = []
            
            for serverEpisode in serverEpisode.results {
                let episode = serverEpisode.convertToEntity()
                episodes.append(episode)
            }
            
            return episodes
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
    
    func getEpisodeDetail(id: Int) -> AnyPublisher<Episode, any Error> {
        return remoteDataSource.getEpisodeDetail(id: id).map { serverEpisode -> Episode in
            let episode = serverEpisode.results.convertToEntity()
            
            return episode
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
}
