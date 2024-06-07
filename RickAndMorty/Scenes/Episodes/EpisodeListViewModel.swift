//
//  EpisodeListViewModel.swift
//  RickAndMorty
//
//  Created by Bruno  on 03/06/24.
//

import Foundation
import Combine
import SwiftUI

class EpisodeListViewModel: ObservableObject {
    @Published public private(set) var episodes: [Episode] = []
    @Published public private(set) var showProgressView = false
    var currentPage: Int = 1
    private var cancellable: AnyCancellable?
    
    func getEpisode(page: Int) {
        showProgressView = true
        
        
        cancellable = GetEpisodeUseCase().execute(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.showProgressView = false
                
                switch completion {
                case .finished:
                    self.currentPage += 1
                    break
                case .failure:
                    break
                }
            }, receiveValue: {(episodes: [Episode]) in
                self.episodes.append(contentsOf: episodes)
            })
    }
}
