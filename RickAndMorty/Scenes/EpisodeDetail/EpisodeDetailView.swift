//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Bruno  on 02/06/24.
//

import SwiftUI

struct EpisodeDetailView: View {
    @StateObject var viewModel: EpisodeDetailViewModel
    @Environment(\.colorScheme) var currentMode
    
    
    var body: some View {
        VStack {
            Text(viewModel.episode.name)
                .font(.title)
                .foregroundStyle(currentMode == .dark ? .blue : .red)
            
            Divider().frame(maxWidth: 240)
            Spacer(minLength: 10)
            
            VStack(spacing: 20) {
                OtherDetailItemView(
                    title: viewModel.episodeSeason,
                    titleIcon: viewModel.episodeSeasonIcon,
                    value: viewModel.episode.episode)
                    .frame(maxWidth: .infinity)
                
                OtherDetailItemView(
                    title: viewModel.airDate,
                    titleIcon: viewModel.airDateIcon,
                    value: viewModel.episode.airDate)
                    .frame(maxWidth: .infinity)
                
                OtherDetailItemView(
                    title: viewModel.characterStarring,
                    titleIcon: viewModel.characterStarringIcon,
                    value: "\(viewModel.characters.count)")
                    .frame(maxWidth: .infinity)
            }
            .padding()
            
            List {
                Section(header: Text(viewModel.characterssTitle)) {
                    if viewModel.showProgressView {
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.characters, id: \.self) { character in
                        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                            OtherCharacterCellView(
                                image: character.image,
                                name: character.name,
                                titleA: viewModel.episodeDetail,
                                subtitleA: "\(character.episode.count) \(viewModel.episodeString)",
                                titleB: viewModel.currentStatus,
                                subtitleB: character.status.rawValue)
                                .frame(maxWidth: .infinity)
                                .padding(5)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .listStyle(.grouped)
        }
        .onAppear {
            viewModel.getEpisodeDetail()
        }
    }
}

let episodePreview = Episode(
    id: 1,
    name: "Pilot",
    episode: "S01E01",
    airDate: "December 2, 2013",
    characters: ["2", "35"])

#Preview {
    EpisodeDetailView(viewModel: EpisodeDetailViewModel(episode: episodePreview))
}
