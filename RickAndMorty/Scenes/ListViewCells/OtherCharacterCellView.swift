//
//  OtherCharacterCellView.swift
//  RickAndMorty
//
//  Created by Bruno  on 03/06/24.
//

import SwiftUI

struct OtherCharacterCellView: View {
    @Environment(\.colorScheme) var currentMode
    var image: String
    var name: String
    var titleA: String
    var subtitleA: String
    var titleB: String
    var subtitleB: String
    
    var body: some View {
        HStack {
            RenderImage(imageUrlString: image)
            Text(name)
                .foregroundStyle(currentMode == .dark ? .blue : .red)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(titleA)
                Text(subtitleA)
                
                Divider().frame(maxWidth: 40)
                
                Text(titleA)
                Text(subtitleA)
            }
            .font(.footnote)
            .foregroundStyle(currentMode == .dark ? .blue : .red)
            .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    OtherCharacterCellView(image: "https://rickandmortyapi.com/api/character/avatar/324.jpeg",
                           name: "name",
                           titleA: "Title A",
                           subtitleA: "Subtitle A",
                           titleB: "Title B",
                           subtitleB: "Subtitle B")
}
