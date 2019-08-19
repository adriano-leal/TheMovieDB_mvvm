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
    var viewModel: NowPlayingViewModel = NowPlayingViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        viewModel.loadMovies {
            DispatchQueue.main.async {
                self.searchTableView.reloadData()
                print("here")
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems() + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "searchMovieCellIdentifier"

        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MovieCarouselTableViewCell else { fatalError() }
            
            cell.movieCarouselCV.dataSource = self
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier: String = "movieCellIdentifier"

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MovieCollectionViewCell else { fatalError() }
        
        cell.movieTitle.text = viewModel.title(at: indexPath.row)
        cell.movieRating.text = String(viewModel.voteAverege(at: indexPath.row))
        viewModel.loadImage(posterPath: viewModel.posterPath(at: indexPath.row)) { (data) in
            DispatchQueue.main.async {
                cell.moviePoster.image = UIImage(data: data)
            }
        }
        return cell
    }

    
    
}
