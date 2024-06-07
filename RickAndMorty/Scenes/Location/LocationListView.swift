//
//  LocationListView.swift
//  RickAndMorty
//
//  Created by Bruno  on 07/06/24.
//

import SwiftUI

struct LocationListView: View {
    @StateObject var viewModel: LocationListViewModel
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        VStack {
            List {
                Section(header: ListHeaderView()) {
                    if viewModel.showProgressView {
                        ProgressViewView()
                    }
                    
                    ForEach(viewModel.loctions) { location in
                        NavigationLink(destination: LocalViewDetail(viewModel: LocationViewModel(location: location))) {
                            OtherCellView(
                                name: location.name,
                                infoA: location.type,
                                infoB: "Dimension",
                                infoBName: location.dimension)
                        }
                        .onAppear {
                            if location == viewModel.loctions.last {
                                viewModel.getLocation(page: viewModel.currentPage)
                            }
                        }
                    }
                }
                .onAppear {
                    if viewModel.locations.isEmpty {
                        viewModel.getLocation(page: 1)
                    }
                }
            }
        }
    }
}

#Preview {
    LocationListView(viewModel: LocationListViewModel())
}
