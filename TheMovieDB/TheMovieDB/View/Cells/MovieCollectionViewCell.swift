//
//  MovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var starRating: UIImageView!
    
    override func awakeFromNib() {
        
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
        
    }
    
}
