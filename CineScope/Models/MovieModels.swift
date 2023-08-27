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
/**
    let ratingsSummary: RatingsSummary?
 */

    enum CodingKeys: String, CodingKey {
        case uid = "_id"
        case id, primaryImage, titleType, titleText, originalTitleText, releaseYear, releaseDate
    }
}


struct PrimaryImage: Codable {
    let id, url, typeName: String?
    let width, height: Int?
//    let caption: String //ommit this later
    
    enum CodingKeys: String, CodingKey {
        case id, width, height, url
        case typeName = "__typename"
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
    let text, typeName: String?
    
    enum CodingKeys: String, CodingKey {
        case text
        case typeName = "__typename"
    }
}

struct ReleaseYear: Codable {
    let year: Int?
    let endYear: Int?
    let typeName: String?
    
    enum CodingKeys: String, CodingKey {
        case year, endYear
        case typeName = "__typename"
    }
}

struct ReleaseDate: Codable {
    let day, month, year: Int?
    let typeName: String?
    
    enum CodingKeys: String, CodingKey {
        case day, month, year
        case typeName = "__typename"
    }
}



