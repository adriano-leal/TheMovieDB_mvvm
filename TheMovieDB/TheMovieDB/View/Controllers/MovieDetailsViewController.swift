//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Luiz Antonio Bolsoni Riboli on 16/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    
    var movieName: String = ""
    var genre: String = ""
    var rating: String = ""
    var overview: String = ""
//    var poster: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.movieTitle.text = movieName
        self.movieGenre.text = genre
        self.movieRating.text = rating
        self.movieOverview.text = overview
//        self.moviePoster.image = poster

        self.title = "Movie Details"
        moviePoster.layer.cornerRadius = 10
        moviePoster.clipsToBounds = true
    }
}
