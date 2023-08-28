//
//  MediaDetailView.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import SwiftUI
import URLImage

struct MediaDetailView: View {
    let mediaDetailItem: Media
    
    @ObservedObject private var viewModel: MediaDetailViewModel
    
    init(media: Media) {
        self.mediaDetailItem = media
        viewModel = MediaDetailViewModel(media: media)
    }
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                GeometryReader { geometry in
                    MediaDetailImage(imageURL: viewModel.imageURL, size: CGSize(width: geometry.size.width, height: 200))
                        .cornerRadius(10)
                }
                .frame(height: 200)
                Text(viewModel.title)
                    .font(.title)
                Text(viewModel.aggregateRating)
                    .font(.caption)
                Spacer()
                Text(viewModel.plot)
            }
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
        }
    }
        
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailView(media: MockMovieData.sampleMovie)
    }
}

struct MediaDetailImage: View {
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
        }
    }
}
