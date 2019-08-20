//
//  PopularMoviesTableViewCell.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 19/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class PopularMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }

}
