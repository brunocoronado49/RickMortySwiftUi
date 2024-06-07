//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Bruno  on 01/06/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        VStack {
            content
        }
        .task {
            if viewModel.characters.isEmpty {
                viewModel.getAllCharacters(page: 1)
            }
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .loading:
            loadingView
        case .loaded:
            loadedView
        case .failed:
            errorView
        }
    }
    
    @ViewBuilder
    var loadingView: some View {
        ProgressViewView()
        Text("Loading new characters...")
    }
    
    @ViewBuilder
    var loadedView: some View {
        characterStatusFilter
        characterListView
    }
    
    @ViewBuilder
    var errorView: some View {
        RenderImage(imageUrlString: "https://imgs.search.brave.com/hwo4TK2jFYS7dPAZC9Y2QuypUNYSv4Aqqz2qnAwRXUk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4u/aWNvbi1pY29ucy5j/b20vaWNvbnMyLzM3/L1BORy85Ni9lcnJv/cl90aGVhcHBsaWNh/dGlvbl8yOTY0LnBu/Zw", width: 250, height: 250)
        Text("Ops, there are some errors.")
        Button(action: {
            viewModel.getAllCharacters(page: viewModel.currentPage)
        }, label: {
            Text("Try again")
        })
    }
    
    @ViewBuilder
    var characterStatusFilter: some View {
        VStack {
            Text("Filter by status")
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
            Picker(selection: $viewModel.selectedStatus, label: Text("Status")) {
                ForEach(CharacterStatus.allCases, id: \.self) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    var characterListView: some View {
        List {
//            Section(content: {
//                ForEach(viewModel.filteredCharacters) { character in
//                    NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
//                        CharacterCellView(image: character.image, name: character.name, status: character.status.rawValue)
//                    }
//                    .onAppear {
//                        if viewModel.shouldLoadMoreCharacters(currentCharacter: character) {
//                            viewModel.getAllCharacters(page: viewModel.currentPage)
//                        }
//                    }
//                }
//                .foregroundStyle(currentMode == .dark ? Color(.blue) : Color(.red))
//                loadedView
//            }, header: {
//                ListHeaderView()
//            })
            Section(header: ListHeaderView()) {
                ForEach(viewModel.filteredCharacters) { character in
                    NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
                        CharacterCellView(image: character.image, name: character.name, status: character.status.rawValue)
                    }
                    .onAppear {
                        if viewModel.shouldLoadMoreCharacters(currentCharacter: character) {
                            viewModel.getAllCharacters(page: viewModel.currentPage)
                        }
                    }
                }
                .foregroundStyle(currentMode == .dark ? Color(.blue) : Color(.red))
                loadedView
            }
        }
    }
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel())
}
