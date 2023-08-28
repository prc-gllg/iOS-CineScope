//
//  SeriesListView.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import SwiftUI

struct SeriesListView: View {
    @Binding var isView: Int
    @StateObject private var viewModel = Media_ListViewModel()
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10)  {
                ForEach(viewModel.mediaList) { media in
                    MediaListCell(media: media, imageSize: CGSize(width: 100, height: 150))
                }
            }
        }
        .onAppear {
            print(SeriesListView.self.Body)
            viewModel.fetchMedia(type: "tvSeries")
        }
    }
}

struct SeriesListView_Previews: PreviewProvider {
    @State static var testSelect = 1
    static var previews: some View {
        SeriesListView(isView: $testSelect)
    }
}
