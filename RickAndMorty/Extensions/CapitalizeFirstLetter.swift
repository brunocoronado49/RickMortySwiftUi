//
//  CapitalizeFirstLetter.swift
//  RickAndMorty
//
//  Created by Bruno  on 28/05/24.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizeFirstLetter()
    }
 }
