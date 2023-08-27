//
//  MediaListViewModel.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/27/23.
//

import Foundation


class MediaListViewModel: ObservableObject {
    @Published var mediaList: [FetchResult] = []
    func fetchMedia() {
        MovieTitlesRequest(year: 2023).fetchMediaRequest { [self] result in
            switch result {
            case .success(let fetchResults):
//                print(fetchResults)
                DispatchQueue.main.async {
                    if let results = fetchResults.results {
                        self.mediaList = results.map{ result in
//                            FetchResult(
//                                uid: result.uid,
//                                id: result.id,
//                                primaryImage: result.primaryImage,
//                                titleType: result.titleType,
//                                titleText: result.titleText,
//                                originalTitleText: result.originalTitleText,
//                                releaseYear: result.releaseYear,
//                                releaseDate: result.releaseDate)
                            FetchResult(
                                uid: result.uid,
                                id: result.id,
                                primaryImage: result.primaryImage,
                                titleType: result.titleType,
                                titleText: result.titleText,
                                originalTitleText: result.originalTitleText,
                                releaseYear: result.releaseYear,
                                releaseDate: result.releaseDate,
                                ratingsSummary: result.ratingsSummary,
                                genres: result.genres,
                                runtime: result.runtime,
                                plot: result.plot)
                        }
                    }
                }
                
            case .failure(let error):
                print("Error in fetchin movies: \(error)")
            }
        }
    }
}
