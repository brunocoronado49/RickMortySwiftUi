//
//  CharacterDetailUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class GetCharacterDetailUseCase {
    private let repository: CharacterRespository
    
    init(repository: CharacterRespository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) -> AnyPublisher<Character, Error> {
        repository.getCharacterDetail(id: id)
    }
}
