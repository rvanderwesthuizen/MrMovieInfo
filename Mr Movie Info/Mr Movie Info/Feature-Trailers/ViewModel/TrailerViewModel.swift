//
//  TrailerViewModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/24.
//

import Foundation

class TrailerViewModel {
    private weak var delegate: ViewModelDelegate?
    private var movieTitle: String?
    private var repository: YoutubeRepositable
    public var videoID: String?
    
    init(repository: YoutubeRepositable, delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    func setupWith(title: String) {
        movieTitle = title.replacingOccurrences(of: " ", with: "+")
        
        retrieveVideoID()
    }
    
    func retrieveVideoID() {
        guard let title = movieTitle else { return }
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
