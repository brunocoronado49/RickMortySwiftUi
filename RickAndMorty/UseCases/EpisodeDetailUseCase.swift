//
//  EpisodeDetailUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class GetEpisodeDetailUseCase {
    private let repository: EpisodeRepository
    
    init(repository: EpisodeRepository = EpisodeRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Episode, Error> {
        repository.getEpisodeDetail(id: id)
    }
}
