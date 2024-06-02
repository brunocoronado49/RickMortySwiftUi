//
//  GetAllCharactersByIdUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class GetAllCharactersByIdUseCase {
    private let repository: CharacterRespository
    
    init(repository: CharacterRespository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(ids: [Int]) -> AnyPublisher<[Character], Error> {
        repository.getAllCharactersById(ids: ids)
    }
}
