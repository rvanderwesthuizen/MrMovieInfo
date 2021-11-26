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
        styling()
        activateActivityIndicator()
        viewModel.retrieveWatchlist()
    }
    
    private func styling() {
        activityIndicatorView.color = MyAppStyle.accentColor
        tableView.backgroundColor = MyAppStyle.darkBackgroundColor
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
        
        cell.contentView.backgroundColor = MyAppStyle.backgroundColor
        cell.configure(with: movieToDisplay)
        
        return cell
    }
    
    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let trailerAction = UITableViewRowAction(style: .default, title: "Trailer") {[weak self] _, indexPath in
            guard let title = self?.viewModel.fetchMovie(at: indexPath.row)?.title else { return }
            let destination = TrailerViewController(movieTitle: title)
            self?.navigationController?.present(destination, animated: true)
        }
        trailerAction.backgroundColor = MyAppStyle.darkBackgroundColor
        
        return [trailerAction]
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
