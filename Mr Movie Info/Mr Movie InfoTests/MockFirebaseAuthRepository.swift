//
//  MockFirebaseAuthRepository.swift
//  Mr Movie InfoTests
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import Foundation
@testable import Mr_Movie_Info

class MockFirebaseAuthRepository: FirebaseAuthRepositable {
    var shouldFail = false
    var user: [String:String] = [:]
    func registerNewUser(withEmail email: String, password: String, completion: @escaping firebaseAuthRepositoryResponseBlock) {
        if !shouldFail {
            user = ["Email" : email, "Password" : password]
            completion(.success(true))
        } else {
            completion(.failure(customError.repositoryError("Error occurred while trying to register new user")))
        }
    }
    
    func signInUser(withEmail email: String, password: String, completion: @escaping firebaseAuthRepositoryResponseBlock) {
        if !shouldFail {
            completion(.success(true))
        } else {
            completion(.failure(customError.repositoryError("Error occurred while trying to login")))
        }
    }
}
