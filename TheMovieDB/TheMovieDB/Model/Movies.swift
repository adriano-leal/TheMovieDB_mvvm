//
//  Movies.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 15/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//   let Movies = try? newJSONDecoder().decode(Movies.self, from: jsonData)

import Foundation

struct Result: Codable {
    let page, totalResults, totalPages: Int
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}


struct Movie: Codable {
    let id: Int
    let voteAverage: Double
    let title: String
    let posterPath: String
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case voteAverage = "vote_average"
        case title
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case overview
    }
}
