//
//  ListHeaderView.swift
//  RickAndMorty
//
//  Created by Bruno  on 02/06/24.
//

import SwiftUI

struct ListHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "eyes")
            Text("Click on any cell for futher information")
        }
        .font(.caption)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ListHeaderView()
}
