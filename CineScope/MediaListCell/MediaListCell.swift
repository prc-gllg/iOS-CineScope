//
//  MediaListCell.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import SwiftUI
import URLImage

struct MediaListCell: View {
    let media: FetchResult
    let imageSize: CGSize = CGSize(width: 100, height: 150)
    
    @ObservedObject private var viewModel:  MediaListCellViewModel
    
    init(media: FetchResult) {
        self.media = media
        viewModel = MediaListCellViewModel(media: media)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            MediaImage(imageURL: viewModel.imageURL, size: imageSize)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(viewModel.titleText)
                    .font(.headline)
                Spacer()
                Text(viewModel.plotText)
                    .font(.caption)
                Spacer()
                Text(viewModel.aggregateRatingText)
                    .font(.caption2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: imageSize.height)
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        .onTapGesture {
            viewModel.handleTap()
        }
    }
}

struct MediaListCell_Previews: PreviewProvider {
    static var previews: some View {
        MediaListCell(media: MockMovieData.sampleMovie)
    }
}

struct MediaImage: View {
    let imageURL: URL?
    let size: CGSize
    var body: some View {
        if let imageURL = imageURL {
            URLImage(imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: size.width, maxHeight: size.height)
                    .clipped()
            }
        } else {
            Image(systemName: "defaultPhoto")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: size.width, maxHeight: size.height)
                .background(Color(.blue))
        }
    }
}
