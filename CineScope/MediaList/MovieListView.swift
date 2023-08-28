//
//  MovieListView.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import SwiftUI

struct MovieListView: View {
    @Binding var isView: Int
    @StateObject private var viewModel = Media_ListViewModel()
    var body: some View {
        List(viewModel.mediaList, id: \.id) { media in
            VStack {
                MediaListCell(media: media)
            }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchMedia()
        }
    }
}

struct MediaListView_Previews: PreviewProvider {
    @State static var testSelect = 0
    static var previews: some View {
        MovieListView(isView: $testSelect)
    }
}
