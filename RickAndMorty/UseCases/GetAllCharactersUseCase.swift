//
//  GetAllCharactersUseCase.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine

class GetAllCharactersUseCase {
    private let repository: CharacterRespository
    
    init(repository: CharacterRespository = CharacterRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(page: Int) -> AnyPublisher<[Character], Error> {
        repository.getAllCharacters(page: page)
    }
}
