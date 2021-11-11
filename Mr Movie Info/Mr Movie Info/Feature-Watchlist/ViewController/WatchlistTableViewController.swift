//
//  WatchlistTableViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/22.
//

import UIKit

class WatchlistTableViewController: UITableViewController {
    private lazy var viewModel = WatchlistTableViewModel(databaseRepository: DatabaseRepository(), delegate: self)
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Watchlist"
        
        tableView.register(SearchResultTableViewCell.nib, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activateActivityIndicator()
        viewModel.retrieveWatchlist()
    }
    
    private func activateActivityIndicator() {
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.startAnimating()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        guard let movieToDisplay = viewModel.fetchMovie(at: indexPath.row) else { return UITableViewCell() }
        
        cell.configure(with: movieToDisplay)
        
        return cell
    }
}

extension WatchlistTableViewController: ViewModelDelegate {
    func refreshViewContent(navigateToMovieDetailsFlag _: Bool) {
        activityIndicatorView.stopAnimating()
        tableView.reloadData()
    }
    
    func didFailWithError(error: Error) {
        activityIndicatorView.stopAnimating()
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "OK")
    }
}
