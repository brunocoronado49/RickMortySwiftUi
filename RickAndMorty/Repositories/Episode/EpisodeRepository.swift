//
//  EpisodeRepository.swift
//  RickAndMorty
//
//  Created by Bruno  on 29/05/24.
//

import Foundation
import Combine

protocol EpisodeRepository {
    func getEpisode(page: Int) -> AnyPublisher<[Episode], Error>
    func getEpisodeDetail(id: Int) -> AnyPublisher<Episode, Error>
}
