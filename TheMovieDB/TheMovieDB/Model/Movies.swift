//
//  Movies.swift
//  TheMovieDB
//
//  Created by Adriano Ramos on 15/08/19.
//  Copyright © 2019 Adriano Ramos. All rights reserved.
//

import Foundation


struct Movies: Codable {
    var adult: Bool
    
    enum CodingKeys: String, CodingKey {
        case adult
    }
    
}
