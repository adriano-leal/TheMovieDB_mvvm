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
        
        self.title = "Now Playing"
        self.navigationController?.navigationBar.prefersLargeTitles = false

        
        nowPlayingCollectionView.delegate = self
        nowPlayingCollectionView.dataSource = self
        
        viewModel.loadMovies {
            DispatchQueue.main.async {
                self.labelResults.text = "Showing \(self.viewModel.numberOfItems()) results"
                self.nowPlayingCollectionView.reloadData()
            }
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? MovieDetailsViewController, let indexPath = sender as? IndexPath {
            
            detailsViewController.movieName = viewModel.title(at: indexPath.row)
            detailsViewController.rating = String(viewModel.voteAverege(at: indexPath.row))
            //genres
            detailsViewController.overview = viewModel.overview(at: indexPath.row)
            viewModel.loadImage(posterPath: viewModel.posterPath(at: indexPath.row)) { (data) in
                DispatchQueue.main.async {
                    detailsViewController.moviePoster.image = UIImage(data: data)
                }
            }
            
        }
    }
    
}

extension NowPlayingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nowPlayingCollectionView.cellForItem(at: indexPath)?.isSelected = false
        performSegue(withIdentifier: "detailsFromNowPlayingSegue", sender: indexPath)
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
