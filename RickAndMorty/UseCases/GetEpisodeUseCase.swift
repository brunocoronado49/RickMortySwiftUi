//
//  GetEpisodeUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class GetEpisodeUseCase {
    private let repository: EpisodeRepository
    
    init(repository: EpisodeRepository = EpisodeRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Episode], Error> {
        repository.getEpisode(page: page)
    }
}
