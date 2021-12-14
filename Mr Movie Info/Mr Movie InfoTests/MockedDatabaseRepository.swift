//
//  MockedDatabaseRepository.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/27.
//

import Foundation
import SearchMDFramework
@testable import Mr_Movie_Info

class MockDatabaseRepository: DatabaseRepositable {
    private var mockedDatabase: [MovieDetails] = []
    var shouldFail = false
    
    func addMovieToWatchlist(details: MovieDetails) {
        mockedDatabase.append(details)
    }
    
    func removeMovieFromWatchlist(at index: Int, failure: @escaping (Error)->Void) {
        if !shouldFail {
            mockedDatabase.remove(at: index)
        } else {
            failure(customError.repositoryError("An error occurred while trying to remove data"))
        }
    }
    
    func retrieveWatchlist(completion: @escaping databaseRepositoryFetchResponseBlock) {
        if !shouldFail {
            completion(.success(mockedDatabase))
        } else {
            completion(.failure(customError.repositoryError("An error occurred while trying to retrieve data")))
        }
    }
}

enum customError: Error {
    case repositoryError(String)
}
