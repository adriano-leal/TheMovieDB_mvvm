//
//  Movies.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 15/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.

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
    let genre: [Genre]
    let backdropPath: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case voteAverage = "vote_average"
        case title
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case genre = "genres"
        case backdropPath = "backdrop_path"
        case overview
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
