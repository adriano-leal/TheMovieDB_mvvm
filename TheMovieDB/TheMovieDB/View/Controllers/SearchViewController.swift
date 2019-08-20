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
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? MovieDetailsViewController, let indexPath = sender as? IndexPath {
            
            nextViewController.movieName = viewModelSearch.title(at: indexPath.row)
            nextViewController.rating = String(viewModelSearch.voteAverege(at: indexPath.row))
//            nextViewController.genre = String(viewModelSearch.genre(at: indexPath.row))
            nextViewController.overview = viewModelSearch.overview(at: indexPath.row)
            
            viewModelSearch.loadImage(posterPath: viewModelSearch.posterPath(at: indexPath.row)) { (data) in
                DispatchQueue.main.async {
                    nextViewController.moviePoster.image = UIImage(data: data)
                }
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
            
            return cell
            
        } else if indexPath.row < viewModelSearch.numberOfItems()  {
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "popularCellIdentifier", for: indexPath) as? PopularMoviesTableViewCell else { fatalError() }
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
        performSegue(withIdentifier: "detailsSegue", sender: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 420.0

        } else {
            return 180.0

        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Popular Movies"
        default:
            return ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelNowPlaying.numberOfItems()
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        searchCollectionView.cellForItem(at: indexPath)?.isSelected = false
//        performSegue(withIdentifier: "detailsSegue", sender: indexPath)
//    }
    
    
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
