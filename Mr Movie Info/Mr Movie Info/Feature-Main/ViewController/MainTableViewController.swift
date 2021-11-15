//
//  ViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import UIKit
import SearchMDFramework

class MainTableViewController: UITableViewController {
    
    private lazy var viewModel = SearchViewModel(delegate: self)
    private var titleForSearch = "the+rookie"
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        setupTextField()
        activityIndicator.isHidden = true
        tableView.register(SearchResultTableViewCell.nib, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
    }
    
    private func setupTextField() {
        searchTextField.returnKeyType = .done
        searchTextField.autocorrectionType = .no
        searchTextField.becomeFirstResponder()
        searchTextField.delegate = self
    }
    
    @IBAction func didTapSearchButton(_ sender: UIButton) {
        searchTextField.resignFirstResponder()
        if let text = searchTextField.text {
            if text.isEmpty {
                showAlert(alertTitle: "No title provided", alertMessage: "Please provide a title for search", actionTitle: "OK")
            } else {
                activateActivityIndicator()
                titleForSearch = text
                viewModel.initialSearch(forTitle: titleForSearch)
            }
        }
    }
    
    private func activateActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
    }
    
    private func navigateToMovieDetailsView(with details: MovieDetails) {
        let destination = MovieDetailsViewController()
        destination.set(details)
        self.show(destination, sender: self)
    }
    
    //MARK: - Tableview datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        guard let searchResult = viewModel.fetchSearchResult(at: indexPath.row) else { return UITableViewCell() }
        
        cell.configure(with: searchResult)
        
        return cell
    }
    
    //MARK: - Tableview delegate methods
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.numberOfRows - 1) {
            viewModel.search(forTitle: titleForSearch)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activityIndicator.startAnimating()
        viewModel.retrieveMovieDetails(at: indexPath.row)
    }
}

extension MainTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension MainTableViewController: PodViewModelDelegate {
    func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
        activityIndicator.stopAnimating()
        if navigateToMovieDetailsFlag {
            guard let movieDetails = viewModel.movieDetails else { return }
            navigateToMovieDetailsView(with: movieDetails)
        } else {
            tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        activityIndicator.stopAnimating()
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "OK")
    }
}
