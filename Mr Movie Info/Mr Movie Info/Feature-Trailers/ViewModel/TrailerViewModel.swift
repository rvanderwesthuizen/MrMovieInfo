//
//  TrailerViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/24.
//

import Foundation

class TrailerViewModel {
    public weak var delegate: ViewModelDelegate?
    private var movieTitle: String
    private var repository: YoutubeRepositable
    public var videoID: String?
    
    init(movieTitle: String, repository: YoutubeRepositable, delegate: ViewModelDelegate) {
        self.movieTitle = movieTitle
        self.repository = repository
        self.delegate = delegate
        
        retrieveVideoID()
    }
    
    func retrieveVideoID() {
        let title = movieTitle.replacingOccurrences(of: " ", with: "+")
        repository.fetchVideoIDUsing(title: title) {[weak self] result in
            switch result {
            case .success(let id):
                self?.videoID = id
                self?.delegate?.refreshViewContent(navigateToMovieDetailsFlag: false)
            case .failure(let error):
                self?.delegate?.didFailWithError(error: error)
            }
        }
    }
}
