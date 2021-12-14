//
//  DatabaseRepositable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/27.
//

import Foundation
import SearchMDFramework

protocol DatabaseRepositable {
    func addMovieToWatchlist(details: MovieDetails)
    func removeMovieFromWatchlist(at index: Int, failure: @escaping (Error)->Void)
    func retrieveWatchlist(completion: @escaping databaseRepositoryFetchResponseBlock)
}
