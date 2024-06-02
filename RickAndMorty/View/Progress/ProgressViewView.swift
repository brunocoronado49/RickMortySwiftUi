//
//  ProgressViewView.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import SwiftUI

struct ProgressViewView: View {
    var body: some View {
        HStack {
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color(.green)))
                .id("Loader")
            
            Spacer()
        }
    }
}

#Preview {
    ProgressViewView()
}
