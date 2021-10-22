//
//  WatchlistTableViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/22.
//

import UIKit

class WatchlistTableViewController: UITableViewController {
    private lazy var viewmodel = WatchlistTableViewModel(databaseRepository: DatabaseRepository(), delegate: self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Watchlist"
        
        tableView.register(SearchResultTableViewCell.nib, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        guard let movieToDisplay = viewmodel.fetchMovie(at: indexPath.row) else { return UITableViewCell() }
        
        cell.configure(with: movieToDisplay)
        
        return cell
    }
}

extension WatchlistTableViewController: ViewModelDelegate {
    func refreshViewContent() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        
    }
}
