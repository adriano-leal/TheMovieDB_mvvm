//
//  SearchViewController.swift
//  TheMovieDB
//
//  Created by Luiz Antonio Bolsoni Riboli on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    

    @IBOutlet weak var searchTableView: UITableView!
    
    var viewModelNowPlaying: NowPlayingViewModel = NowPlayingViewModel()
    
    var viewModelSearch: SearchViewModel = SearchViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        viewModelNowPlaying.loadMovies {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
                print("here")
            }
        }
        
        viewModelSearch.loadMoviesPopular {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
                print("search")
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelNowPlaying.numberOfItems() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "searchMovieCellIdentifier"

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MovieCarouselTableViewCell else { fatalError() }
            
            cell.movieCarouselCV.dataSource = self
//            cell.loadMoviesInCell()
            
            
            
            
            return cell
            
        } else if indexPath.row < viewModelSearch.numberOfItems()  {
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "popularCellIdentifier", for: indexPath) as? PopularMoviesTableViewCell else { fatalError() }
            
//            cell.movieCarouselCV.dataSource = self
            cell.movieTitle.text = viewModelSearch.title(at: indexPath.row)
            cell.movieRating.text = String(viewModelSearch.voteAverege(at: indexPath.row))
            cell.movieDescription.text = viewModelSearch.overview(at: indexPath.row)
            viewModelSearch.loadImage(posterPath: viewModelSearch.posterPath(at: indexPath.row)) { (data) in
                DispatchQueue.main.async {
                    cell.moviePoster.image = UIImage(data: data)
                }
            }
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelNowPlaying.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String = "movieCellIdentifier"

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MovieCollectionViewCell else { fatalError() }
        
        cell.movieTitle.text = viewModelNowPlaying.title(at: indexPath.row)
        cell.movieRating.text = String(viewModelNowPlaying.voteAverege(at: indexPath.row))
        viewModelNowPlaying.loadImage(posterPath: viewModelNowPlaying.posterPath(at: indexPath.row)) { (data) in
            DispatchQueue.main.async {
                cell.moviePoster.image = UIImage(data: data)
            }
        }
        return cell
    }

    
    
}
