//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Bruno  on 02/06/24.
//

import SwiftUI
import Foundation
import Combine

class EpisodeDetailViewModel: ObservableObject {
    @Published public private(set) var episode: Episode
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var showProgressView = false
    
    private var charactersId: [Int] = []
    private var cancellable: AnyCancellable?
    
    let episodeSeasonIcon: String
    let episodeSeason: String
    let airDateIcon: String
    let airDate: String
    let characterStarringIcon: String
    let characterStarring: String
    let characterssTitle: String
    let episodeDetail: String
    let episodeString: String
    let currentStatus: String
    
    let unknownInfo: String
    let unknownString: String
    let imagesize: CGFloat = 50
    let cornerRadius: CGFloat = 50
    
    init(episode: Episode) {
        self.episode = episode
        episodeSeasonIcon = "📺"
        episodeSeason = "Episode"
        airDateIcon = "📆"
        airDate = "Air Date"
        characterStarringIcon = "🛸"
        characterStarring = "No. Characters Starring"
        characterssTitle = "Characters"
        episodeDetail = "Been in"
        episodeString = "Episodes"
        currentStatus = "Current status"
        unknownInfo = "unknown"
        unknownString = "unknown"
        charactersId = getCharactersID()
    }
    
    func getCharactersID() -> [Int] {
        var charactersIds: [Int] = []
        
        for character in episode.characters {
            let characterSplit = character.split(separator: "/")
            let characterId = (characterSplit.last! as NSString).integerValue
            
            charactersIds.append(characterId)
        }
        return charactersIds
    }
    
    func getAllEpisodeCharactersBtyId() {
        showProgressView = true
        
        cancellable = GetAllCharactersByIdUseCase().execute(ids: charactersId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { (characters: [Character]) in
                self.characters = characters
            })
    }
    
    func getEpisodeDetail() {
        showProgressView = true
        
        cancellable = GetEpisodeDetailUseCase().execute(id: episode.id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showProgressView = false
                self.getAllEpisodeCharactersBtyId()
                
                switch completion {
                case .finished:
                    break
                case .failure:
                    break
                }
            }, receiveValue: { (episode: Episode) in
                self.episode = episode
            })
    }
}
