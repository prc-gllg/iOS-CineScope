//
//  MediaListCellViewModel.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/28/23.
//

import Foundation
import SwiftUI

protocol MediaListCellViewModelProtocol: ObservableObject{
    var titleText: String { get }
    var plotText: String { get }
    var aggregateRatingText: String { get }
    var imageURL: URL? { get }
    
    func handleTap()
}

class MediaListCellViewModel: MediaListCellViewModelProtocol {
    
    @Published var titleText: String
    @Published var plotText: String
    @Published var aggregateRatingText: String
    @Published var imageURL: URL?
    
    init(media: FetchResult) {
        self.titleText = media.titleText?.text ?? "No title"
        self.plotText = media.plot?.plotText?.plainText ?? "No plot"
        self.aggregateRatingText = "\(round((media.ratingsSummary?.aggregateRating ?? 0.0) * 10) / 10.0)"
        self.imageURL = URL(string: media.primaryImage?.url ?? "")
    }
    func handleTap() {
        print(titleText)
    }
}
