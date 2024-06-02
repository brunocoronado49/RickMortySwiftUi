//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by Bruno  on 01/06/24.
//

import SwiftUI
import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
    @Published internal var state: State = .loading
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var showProgressView = false
    @Published internal var selectedStatus: CharacterStatus = .all
    
    var currentPage = 1
    private var cancellable: AnyCancellable?
    
    func getAllCharacters(page: Int) {
        showProgressView = true
        
        cancellable = GetAllCharactersUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [self] completion in
                switch completion {
                case .finished:
                    self.currentPage += 1
                    self.state = .loaded
                case .failure:
                    self.state = .failed
                }
            }, receiveValue:  { (characters: [Character]) in
                self.characters.append(contentsOf: characters)
            })
    }
    
    func shouldLoadMoreCharacters(currentCharacter: Character) -> Bool {
        return currentCharacter == characters.last
    }
    
    internal var filteredCharacters: [Character] {
        if selectedStatus == .all {
            return characters
        } else {
            return characters.filter {
                $0.status.rawValue == selectedStatus.rawValue
            }
        }
    }
    
}

extension CharacterListViewModel {
    enum State: Equatable {
        case loading
        case loaded
        case failed
    }
}
