//
//  MockYoutubeRepository.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/25.
//

import Foundation
@testable import Mr_Movie_Info

class MockYoutubeRepository: YoutubeRepositable {
    var shouldFail = false
    
    func fetchVideoIDUsing(title: String, completion: @escaping youtubeRepositoryResponseBlock) {
        if !shouldFail {
            if title == "Movie+Title" {
                completion(.success("1234"))
            } else {
                completion(.failure(customError.repositoryError("Error occurred while trying to register new user")))
            }
        } else {
            completion(.failure(customError.repositoryError("Error occurred while trying to register new user")))
        }
    }
}
