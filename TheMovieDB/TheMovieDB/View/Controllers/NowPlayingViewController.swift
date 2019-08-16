//
//  NowPlayingViewController.swift
//  TheMovieDB
//
//  Created by Luiz Antonio Bolsoni Riboli on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    @IBOutlet weak var nowPlayingCollectionView: UICollectionView!
    var viewModel: NowPlayingViewModel = NowPlayingViewModel()
    
    @IBOutlet weak var labelResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nowPlayingCollectionView.delegate = self
        nowPlayingCollectionView.dataSource = self
        
        viewModel.loadMovies {
            DispatchQueue.main.async {
                self.labelResults.text = "Showing \(self.viewModel.numberOfItems()) results"
                self.nowPlayingCollectionView.reloadData()
            }
        }

    }
    
}


extension NowPlayingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
