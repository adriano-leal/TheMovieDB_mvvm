//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Luiz Antonio Bolsoni Riboli on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import Foundation

class NowPlayingViewModel {
    
    private var network = Network()
    var networkManager: NetworkManager = NetworkManager()
    private var arrayMovies: [Movie] = []
    
    var isSelected: Bool = false
    
    
    func loadMovies(callback: @escaping () -> Void) {
        networkManager.getNowPlayingMovies(networkLayer: network,
                                                  onSuccess:{ movies in
                                                    self.arrayMovies = self.networkManager.movies
                                                    callback()
        })
    }
    
    func loadMoviesPopular(callback: @escaping () -> Void) {
        networkManager.getPopularMovies(networkLayer: network,
                                               onSuccess:{ movies in
                                                    self.arrayMovies = self.networkManager.movies
                                                    callback()
        })
    }
    
    func loadImage(posterPath: String, callback: @escaping (Data) -> Void) {
        networkManager.getImage(networkLayer: network, posterPath: posterPath, onSuccess: { data  in
            callback(data)
        })
    }
    
    func title(at index: Int) -> String {
        return arrayMovies[index].title
    }
    
    func id(at index: Int) -> Int {
        return arrayMovies[index].id
    }
    
    func genre(at index: Int) -> [Int] {
        return arrayMovies[index].genreIDS
    }
    
    func originalTitle(at index: Int) -> String {
        return arrayMovies[index].originalTitle
    }
    
    func overview(at index: Int) -> String {
        return arrayMovies[index].overview
    }
    
    func posterPath(at index: Int) -> String {
        return arrayMovies[index].posterPath
    }
    
    func voteAverege(at index: Int) -> Double {
        return arrayMovies[index].voteAverage
    }
    
    func backdropPath(at index: Int) -> String {
        return arrayMovies[index].backdropPath
    }
    
    func numberOfItems() -> Int {
        return arrayMovies.count
    }
    
}
