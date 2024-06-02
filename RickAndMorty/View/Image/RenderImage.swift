//
//  RenderImage.swift
//  RickAndMorty
//
//  Created by Bruno  on 31/05/24.
//

import SwiftUI

struct RenderImage: View {
    let imageUrlString: String
    var width: CGFloat? = 60
    var height: CGFloat? = 60
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrlString)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: height)
                        .clipShape(RoundedRectangle(cornerRadius: 60))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .id("imageLoaded")
                case .failure:
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: height)
                        .clipShape(RoundedRectangle(cornerRadius: 60))
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        .id("defaultImageLoaded")
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    RenderImage(imageUrlString: "https://imgs.search.brave.com/GYmtrmCCJzJUvro1_QV3TxUJ3w5Ni7IQGueTVExf1kM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2E3LzVk/LzU3L2E3NWQ1N2E4/Mzc0NGIwODk3YzU3/ZTE4NTEyMTMyOWQy/LmpwZw", width: 360, height: 360)
}
