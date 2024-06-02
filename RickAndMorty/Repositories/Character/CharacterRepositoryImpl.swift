//
//  CharacterRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Bruno  on 29/05/24.
//

import Foundation
import Combine

class CharacterRepositoryImpl: CharacterRespository {
    private let remoteDataSource: CharacterRemoteDataSource
    
    init(remoteDataSource: CharacterRemoteDataSource = CharacterRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], any Error> {
        return remoteDataSource.getAllCharacters(page: page).map { serverCharacter -> [Character] in
            var characters: [Character] = []
            
            for serverCharacter in serverCharacter.results {
                let character = serverCharacter.convertToEntity()
                characters.append(character)
            }
            
            return characters
        }
        .mapError({$0})
        .eraseToAnyPublisher()
    }
    
    func getCharacterDetail(id: Int) -> AnyPublisher<Character, any Error> {
        return remoteDataSource.getCharacterDetail(id: id).map { serverCharacter -> Character in
            let character = serverCharacter.convertToEntity()
            
            return character
        }
        .map({$0})
        .eraseToAnyPublisher()
    }
    
    func getAllCharactersById(ids: [Int]) -> AnyPublisher<[Character], any Error> {
        let publishers = ids.map(getCharacterDetail(id:))
        
        return Publishers.MergeMany(publishers)
            .collect()
            .eraseToAnyPublisher()
    }
}
