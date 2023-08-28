//
//  UpcomingEpisodesListView.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import SwiftUI

struct UpcomingEpisodesListView: View {
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

struct UpcomingEpisodesListView_Previews: PreviewProvider {
    @State static var testSelect = 2
    static var previews: some View {
        UpcomingEpisodesListView(isView: $testSelect)
    }
}
