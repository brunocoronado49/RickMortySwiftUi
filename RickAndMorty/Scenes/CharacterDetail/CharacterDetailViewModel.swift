//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import Foundation
import Combine
import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published public private(set) var character: Character
    @Published public private(set) var showProgressView: Bool = false
    
    let location: String
    let gender: String
    let status: String
    let origin: String
    let species: String
    
    let unknownInto: String
    let unknownString: String
    
    private var cancellable: AnyCancellable?
    
    init(character: Character) {
        self.character = character
        location = "Currently living in"
        gender = "Gender"
        status = "Status"
        origin = "Origin"
        species = "Species"
        unknownInto = "Unkown info"
        unknownString = "Unknown String"
    }
    
    func getCharacterDetail() {
        showProgressView = true
        
        cancellable = GetCharacterDetailUseCase().execute(id: character.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
                
            }, receiveValue: {
                (character: Character) in
                self.character = character
            })
    }
}
