//
//  MediaDetailViewModel.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import Foundation
import SwiftUI

protocol MediaDetailViewModelProtocol: ObservableObject {
    var imageURL: URL? { get }
    var title: String { get }
    var plot: String { get }
    var aggregateRating: String { get }
}

class MediaDetailViewModel: MediaDetailViewModelProtocol {
    
    @Published var imageURL: URL?
    @Published var title: String
    @Published var plot: String
    @Published var aggregateRating: String
    
    init(media: Media) {
        self.imageURL = URL(string: media.primaryImage?.url ?? "")
        self.title = media.titleText?.text ?? "No title"
        self.plot = media.plot?.plotText?.plainText ?? "No plot"
        self.aggregateRating = "Rating: \(round((media.ratingsSummary?.aggregateRating ?? 0.0) * 10) / 10.0) (\(media.ratingsSummary?.voteCount ?? 0))"
    }
}
