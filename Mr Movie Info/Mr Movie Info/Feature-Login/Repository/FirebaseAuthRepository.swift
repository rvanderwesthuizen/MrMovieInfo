//
//  FirebaseAuthRepository.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import Foundation
import FirebaseAuth
import CoreMedia

class FirebaseAuthRepository: FirebaseAuthRepositable {
    func registerNewUser(withEmail email: String, password: String, completion: @escaping firebaseAuthRepositoryResponseBlock) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.success(true))
                }
            }
        }
    }
    
    func signInUser(withEmail email: String, password: String, completion: @escaping firebaseAuthRepositoryResponseBlock) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
            } else {
                DispatchQueue.main.async {
                    completion(.success(true))
                }
            }
        }
    }
}
