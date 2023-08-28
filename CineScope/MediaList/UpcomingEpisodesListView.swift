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
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(viewModel.mediaList) { media in
                    NavigationLink(destination:
                        MediaDetailView(media: media)
                    ){
                        MediaListCell(media: media, imageSize: CGSize(width: 100, height: 150))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .onAppear {
            print(UpcomingEpisodesListView.self.Body)
            viewModel.fetchMedia(type: "tvEpisode")
        }
    }
}

struct UpcomingEpisodesListView_Previews: PreviewProvider {
    @State static var testSelect = 2
    static var previews: some View {
        UpcomingEpisodesListView(isView: $testSelect)
    }
}
