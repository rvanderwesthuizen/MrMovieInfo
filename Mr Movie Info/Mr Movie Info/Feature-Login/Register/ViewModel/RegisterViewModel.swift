//
//  RegisterViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import Foundation

class RegisterViewModel {
    private weak var delegate: ViewModelDelegate?
    private var repository: FirebaseAuthRepositable
    
    init(repository: FirebaseAuthRepositable, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    func registerNewUser(withEmail email: String, password: String) {
        repository.registerNewUser(withEmail: email, password: password) { [weak self] result in
            switch result {
            case .success(_):
                self?.delegate?.refreshViewContent(navigateToMovieDetailsFlag: false)
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}
