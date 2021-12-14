//
//  FirebaseAuthRepositable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import Foundation

typealias firebaseAuthRepositoryResponseBlock = ((Result<Bool,Error>) -> Void)

protocol FirebaseAuthRepositable {
    func registerNewUser(withEmail email: String, password: String, completion: @escaping firebaseAuthRepositoryResponseBlock)
    func signInUser(withEmail email: String, password: String, completion: @escaping firebaseAuthRepositoryResponseBlock)
}
