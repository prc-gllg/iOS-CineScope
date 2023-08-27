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
    let imageSize: CGSize = CGSize(width: 100, height: 100)
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            MediaImage(image: media.primaryImage, size: imageSize)
//                .background(Color(.red))
            VStack(alignment: .leading) {
                Text(media.titleText?.text ?? "No Title")
                    .font(.headline)
                Spacer()
                Text(media.plot?.plotText?.plainText ?? "No Plot")
                    .font(.caption)
                Spacer()
                Text("\(media.ratingsSummary?.aggregateRating ?? 0.0)")
                    .font(.caption2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
//            .background(Color(.cyan))
        }
        .frame(maxWidth: .infinity, maxHeight: imageSize.height)
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
//        .background(Color(.green))
        .onTapGesture {
            print(media.titleText?.text ?? "No Title")
        }
    }
}

struct MediaListCell_Previews: PreviewProvider {
    static var previews: some View {
        MediaListCell(media: MockMovieData.sampleMovie)
    }
}

struct MediaImage: View {
    let image: PrimaryImage?
    let size: CGSize
    var body: some View {
        if let imageURLString = image?.url,
           let imageURL = URL(string: imageURLString) {
            URLImage(imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
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
