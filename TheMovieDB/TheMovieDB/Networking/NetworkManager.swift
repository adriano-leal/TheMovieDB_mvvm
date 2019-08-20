//
//  NetworkManager.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import Foundation

class NetworkManager {
    
    var movies: [Movie] = []
    private var apiKey: String = "3efb9474b7341b05c9d3cd97558608bd"
    
    func getPopularMovies(networkLayer: Network,
                    onSuccess: @escaping ([Movie]) -> Void,
                    onError: @escaping ((String) -> Void) = {_ in return}) {
        let successHandler: (Result) -> Void = { (results) in
            self.movies = results.results

            onSuccess(self.movies)
        }
        
        networkLayer.get(urlString: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1",
                         successHandler: successHandler,
                         errorHandler: onError)
    }
    
    
    
    func getNowPlayingMovies(networkLayer: Network,
                             onSuccess: @escaping ([Movie]) -> Void,
                             onError: @escaping ((String) -> Void) = {_ in return}) {
        let successHandler: (Result) -> Void = { (results) in
            self.movies = results.results

            onSuccess(self.movies)
        }
        
        networkLayer.get(urlString: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US&page=1",
                         successHandler: successHandler,
                         errorHandler: onError)
    }
    
    func getImage(networkLayer: Network,
                             posterPath: String,
                             onSuccess: @escaping (Data) -> Void,
                             onError: @escaping ((String) -> Void) = {_ in return}) {
        let successHandler: (Data) -> Void = { (data) in
            onSuccess(data)
        }
        
        networkLayer.getData(urlString: "https://image.tmdb.org/t/p/w500/\(posterPath)",
                         successHandler: successHandler,
                         errorHandler: onError)
    }
}
