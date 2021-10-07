//
//  ViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import UIKit

class MainTableViewController: UITableViewController {

    private lazy var viewModel = MainTableViewModel(repository: SearchRepository(), delegate: self)
    private var titleForSearch = "Thor"
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.retrieveData(forTitle: titleForSearch)
    }
    
    //MARK: - Tableview datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.fetchTitle(at: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.numberOfRows - 1) {
            viewModel.loadNextPage(forTitle: titleForSearch)
        }
    }
}

extension MainTableViewController: ViewModelDelegate {
    func refreshViewContent() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        show(alert, sender: self)
    }
}
