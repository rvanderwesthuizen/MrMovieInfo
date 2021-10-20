//
//  MovieDetailsRepositable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/19.
//

import Foundation

typealias movieDetailsRepositoryResponseBlock = ((Result<MovieDetails,Error>) -> Void)

protocol MovieDetailRepositable {
    func performRequestWith(imdbID: String, completion: @escaping movieDetailsRepositoryResponseBlock)
}
