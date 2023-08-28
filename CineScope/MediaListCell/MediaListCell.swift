//
//  MediaListCell.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import SwiftUI
import URLImage

struct MediaListCell: View {
    let mediaCellItem: Media
    let imageSize: CGSize
    @ObservedObject private var viewModel:  MediaListCellViewModel
    
    init(media: Media, imageSize: CGSize) {
        self.mediaCellItem = media
        viewModel = MediaListCellViewModel(media: media)
        self.imageSize = imageSize
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            MediaCellImage(imageURL: viewModel.imageURL, size: imageSize)
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
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 10, trailing: 0))
        }
        .frame(maxWidth: .infinity, idealHeight: imageSize.height)
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
//        .onTapGesture {
//            viewModel.handleTap()
//        }
    }
}

struct MediaListCell_Previews: PreviewProvider {
    static var previews: some View {
        MediaListCell(media: MockMovieData.sampleMovie, imageSize: CGSize(width: 100, height: 150))
    }
}

struct MediaCellImage: View {
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
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: size.width, maxHeight: size.height)
                .background(Color(.blue))
        }
    }
}
