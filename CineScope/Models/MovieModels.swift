//
//  MovieModels.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/25/23.
//

import Foundation

//result from /titles
struct FetchResults: Codable {
    let page, next: String?
    let entries: Int?
    let results: [FetchResult]?
    
    enum CodingKeys: String, CodingKey {
        case page, next, entries, results
    }
}

struct FetchResult: Codable, Identifiable {
    //standard results from /titles
    let uid,id: String?
    let primaryImage: PrimaryImage?      //PrimaryImage
    let titleType: TitleType?           //TitleType
    let titleText: TitleText?           //TitleText
    let originalTitleText: TitleText?   //TitleText
    let releaseYear: ReleaseYear?         //ReleaseYear
    let releaseDate: ReleaseDate?         //ReleaseDate

    let ratingsSummary: RatingsSummary?
    let genres: Genres?
    let runtime: Runtime?
    let plot: Plot?


    enum CodingKeys: String, CodingKey {
        case uid = "_id"
        case id, primaryImage, titleType, titleText, originalTitleText, releaseYear, releaseDate
        case ratingsSummary, genres, runtime, plot
    }
}


struct PrimaryImage: Codable {
    let id, url: String?
    let width, height: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, url
    }
}

struct TitleType: Codable {
    let text, id: String?
    let isSeries, isEpisode: Bool?
    
    enum CodingKeys: String, CodingKey {
        case text, id, isSeries, isEpisode
    }
}

struct TitleText: Codable {
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case text
    }
}

struct ReleaseYear: Codable {
    let year, endYear: Int?
    
    enum CodingKeys: String, CodingKey {
        case year, endYear
    }
}

struct ReleaseDate: Codable {
    let day, month, year: Int?
    
    enum CodingKeys: String, CodingKey {
        case day, month, year
    }
}

struct RatingsSummary: Codable {
    let aggregateRating: Float?
    let voteCount: Int?
    enum CodingKeys: String, CodingKey {
        case aggregateRating, voteCount
    }
}

struct Genres: Codable {
    let text, id: String?
    enum CodingKeys: String, CodingKey {
        case text, id
    }
}

struct Runtime: Codable {
    struct DisplayableProperty: Codable {
        struct Value: Codable {
            let plainText: String?
            enum CodingKeys: String, CodingKey {
                case plainText
            }
        }
        let value: Value?
    }
    let seconds: Int?
    let displayableProperty: DisplayableProperty?
    
    enum CodingKeys: String, CodingKey {
        case seconds, displayableProperty
    }
}

struct Plot: Codable {
    struct PlotText: Codable {
        let plainText: String?
        enum CodingKeys: String, CodingKey {
            case plainText
        }
    }
    struct Language: Codable {
        let id: String?
        enum CodingKeys: String, CodingKey {
            case id
        }
    }
    
    let plotText: PlotText?
    let language: Language?
    
    enum CodingKeys: String, CodingKey {
        case plotText, language
    }
}

//MARK: - MockData

struct MockMovieData {
    static let sampleMovie = FetchResult(uid: "123456789",
                                             id: "00000",
                                             primaryImage: nil,
                                             titleType: nil,
                                             titleText: TitleText(text: "Movieeeee"),
                                             originalTitleText: TitleText(text: "Movieeeee"),
                                             releaseYear: nil,
                                             releaseDate: nil,
                                             ratingsSummary: RatingsSummary(aggregateRating: 6.463, voteCount: 49875),
                                             genres: Genres(text: "Action", id: "Eng"),
                                             runtime: nil,
                                             plot: Plot(plotText: Plot.PlotText(plainText: "Plot plot plot plot"), language: Plot.Language(id: "English")))
    static let movies = [sampleMovie, sampleMovie, sampleMovie]
}
