//
//  Media_ListViewModel.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/27/23.
//

import Foundation


class Media_ListViewModel: ObservableObject {
    @Published var mediaList: [Media] = []
    func fetchMedia(type: String) {
        MovieTitlesRequest(year: 2023).fetchMediaRequest { [self] result in
            switch result {
            case .success(let fetchResults):
                DispatchQueue.main.async {
                    print("Data fetched: \(type)")
                    self.mediaList = []
                    if let results = fetchResults.results {
                        self.mediaList = results.filter { result in
                            return result.titleType?.id == type
                        }
                        .map{ result in
                            Media(
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
                                plot: result.plot
                            )
                        }
                    }
                }
                
            case .failure(let error):
                print("Error in fetchin movies: \(error)")
            }
        }
    }
}
