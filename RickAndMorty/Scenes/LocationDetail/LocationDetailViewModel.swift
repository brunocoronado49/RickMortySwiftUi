//
//  LocationDetailViewModel.swift
//  RickAndMorty
//
//  Created by Bruno  on 07/06/24.
//

import Foundation
import Combine
import SwiftUI

class LocationDetailViewModel: ObservableObject {
    @Published public private(set) var location: Location
    @Published public private(set) var characters: [Character] = []
    @Published public private(set) var showProgressView = false
    
    private var residentIds: [Int] = []
    private var cancellable: AnyCancellable?
    
    // TODO: Terminar las demas propiedades, con su constructor y sus funciones
}
