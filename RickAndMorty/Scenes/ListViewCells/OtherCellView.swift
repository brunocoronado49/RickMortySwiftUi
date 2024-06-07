//
//  OtherCellView.swift
//  RickAndMorty
//
//  Created by Bruno  on 03/06/24.
//

import SwiftUI

struct OtherCellView: View {
    @Environment(\.colorScheme) var currentMode
    
    var name: String
    var infoA: String
    var infoB: String
    var infoBName: String
    let spacing: CGFloat = 10
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Spacer()
            
            Text(name)
                .foregroundStyle(currentMode == .dark ? .blue : .red)
            
            VStack(alignment: .leading) {
                Text(infoA)
                
                if infoB == "unknown" || infoB == "Unknown" {
                    Text("Unknown")
                } else {
                    Text("\(infoBName): \(infoB)")
                }
            }
            .font(.footnote)
            .foregroundStyle(currentMode == .dark ? .blue : .red)
            Spacer()
        }
    }
}

#Preview {
    OtherCellView(name: "Name", infoA: "INFOA", infoB: "INFOB", infoBName: "INFOBNAME")
}
