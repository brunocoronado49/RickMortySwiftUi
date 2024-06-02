//
//  CharacterDetailItemView.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import SwiftUI

struct CharacterDetailItemView: View {
    @Environment(\.colorScheme) var currentMode
    
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.footnote)
                .foregroundStyle(Color(.blue))
            
            Spacer()
            
            VStack {
                Text(value)
                    .foregroundStyle(currentMode == .dark ? Color(.blue) : Color(.red))
            }
        }
    }
}

#Preview {
    CharacterDetailItemView(title: "Title", value: "Value")
}
