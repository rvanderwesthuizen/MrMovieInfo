//
//  MockedSearchRepository.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import Foundation
@testable import Mr_Movie_Info

struct MockedSearchRepository: SearchRepositable {
    var shouldFail = false
    var mod10Is0 = true
    
    func performRequestWith(title: String, pageNumber: Int, completion: @escaping repositoryResponseBlock) {
        if !shouldFail {
            if mod10Is0 {
                let model = SearchModel(results: [Search(title: title, year: "", imdbID: "", type: "", poster: "")], totalResults: "20")
                completion(.success(model))
            } else {
                let model = SearchModel(results: [Search(title: title, year: "", imdbID: "", type: "", poster: "")], totalResults: "24")
                completion(.success(model))
            }
        } else {
            completion(.failure(customError.repositoryError("An error occurred while trying to retrieve data")))
        }
    }
}

enum customError: Error {
    case repositoryError(String)
}
