//
//  EpisodeListView.swift
//  RickAndMorty
//
//  Created by Bruno  on 03/06/24.
//

import SwiftUI

struct EpisodeListView: View {
    @StateObject var viewModel: EpisodeListViewModel
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView()) {
                    if viewModel.showProgressView {
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.episodes) { episode in
                        // TODO
                    }
                }
            }
        }
    }
}

#Preview {
    EpisodeListView(viewModel: EpisodeListViewModel())
}
