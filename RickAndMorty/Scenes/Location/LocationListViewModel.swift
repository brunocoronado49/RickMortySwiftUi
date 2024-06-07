//
//  LocationListViewModel.swift
//  RickAndMorty
//
//  Created by Bruno  on 07/06/24.
//

import Foundation
import Combine
import SwiftUI

class LocationListViewModel: ObservableObject {
    @Published public private(set) var loctions: [Location] = []
    @Published public private(set) var showProgressView = false
    
    var currentPage = 1
    private var cancellable: AnyCancellable?
    
    func getLocation(page: Int) {
        showProgressView = true
        
        cancellable = GetLocationUseCase().execute(page: page)
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
            }, receiveValue: {(location: [Location]) in
                self.loctions.append(contentsOf: location)
            })
    }
}
