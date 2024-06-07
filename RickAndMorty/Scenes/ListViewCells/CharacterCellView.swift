//
//  CharacterCellView.swift
//  RickAndMorty
//
//  Created by Bruno  on 02/06/24.
//

import SwiftUI

struct CharacterCellView: View {
    @Environment(\.colorScheme) var currentMode
    
    var image: String
    var name: String
    var status: String
    
    var body: some View {
        HStack(spacing: 16) {
            RenderImage(imageUrlString: image)
            VStack {
                Text(name)
                    .foregroundStyle(currentMode == .dark ? Color(.blue) : Color(.red))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(status)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    CharacterCellView(image: "", name: "", status: "")
}
