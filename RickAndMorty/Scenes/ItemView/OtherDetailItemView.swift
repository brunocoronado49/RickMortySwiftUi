//
//  OtherDetailItemView.swift
//  RickAndMorty
//
//  Created by Bruno  on 03/06/24.
//

import SwiftUI

struct OtherDetailItemView: View {
    @Environment(\.colorScheme) var currentValue
    
    var title: String
    var titleIcon: String
    var value: String
    
    var body: some View {
        HStack {
            Text(titleIcon)
                .font(.footnote)
            
            Text(title)
                .font(.footnote)
                .foregroundStyle(Color(.blue))
            
            Spacer()
            
            VStack {
                Text(value)
                    .foregroundStyle(currentValue == .dark ? Color(.blue) : Color(.red))
            }
        }
    }
}

#Preview {
    OtherDetailItemView(
    title: "📺", titleIcon: "Title", value: "Value")
}
