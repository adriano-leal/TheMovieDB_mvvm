//
//  MovieCarouselTableViewCell.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class MovieCarouselTableViewCell: UITableViewCell {

    @IBOutlet weak var movieCarouselCV: UICollectionView!
    
//    var viewModel: NowPlayingViewModel = NowPlayingViewModel()

    
    
//    func loadMoviesInCell() {
//        viewModel.loadMoviesPopular {
//            DispatchQueue.main.async {
//                self.movieCarouselCV.reloadData()
//                print("search")
//            }
//        }
//    }
    
}

//
//extension MovieCarouselTableViewCell: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.numberOfItems()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let identifier: String = "movieCellIdentifier"
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MovieCollectionViewCell else { fatalError() }
//
//        cell.movieTitle.text = viewModel.title(at: indexPath.row)
//        cell.movieRating.text = String(viewModel.voteAverege(at: indexPath.row))
//        viewModel.loadImage(posterPath: viewModel.posterPath(at: indexPath.row)) { (data) in
//            DispatchQueue.main.async {
//                cell.moviePoster.image = UIImage(data: data)
//            }
//        }
//        return cell
//    }
//
//
//
//}
