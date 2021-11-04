//
//  LoginViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import Foundation

class LoginViewModel {
    private weak var delegate: ViewModelDelegate?
    private var repository: FirebaseAuthRepositable
    
    init( repository: FirebaseAuthRepositable, delegate: ViewModelDelegate) {
        self.delegate = delegate
        self.repository = repository
    }
    
    
    func loginUser(withEmail email: String, password: String) {
        repository.signInUser(withEmail: email, password: password) { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.refreshViewContent(navigateToMovieDetailsFlag:false)
            case.failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}
