//
//  CharacterRespository.swift
//  RickAndMorty
//
//  Created by Bruno  on 29/05/24.
//

import Foundation
import Combine

protocol CharacterRespository {
    func getAllCharacters(page: Int) -> AnyPublisher<[Character], Error>
    func getCharacterDetail(id: Int) -> AnyPublisher<Character, Error>
    func getAllCharactersById(ids: [Int]) -> AnyPublisher<[Character], Error>
}
