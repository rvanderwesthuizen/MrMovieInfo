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
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var searchFunctionalityView: UIView!
    @IBOutlet private weak var searchBarTextField: UITextField!
    @IBOutlet private weak var suggestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        styling()
        setupTextField()
        activityIndicator.isHidden = true
        tableView.register(SearchResultTableViewCell.nib, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
    }
    
    private func styling() {
        activityIndicator.color = MyAppStyle.accentColor
        
        searchButton.backgroundColor = MyAppStyle.darkBackgroundColor
        searchButton.tintColor = MyAppStyle.accentColor
        searchButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        suggestionButton.backgroundColor = MyAppStyle.darkBackgroundColor
        suggestionButton.tintColor = MyAppStyle.bodyTextColor
        suggestionButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        searchFunctionalityView.backgroundColor = MyAppStyle.backgroundColor
        
        searchBarTextField.tintColor = MyAppStyle.accentColor
        searchBarTextField.backgroundColor = MyAppStyle.darkBackgroundColor
        
        tableView.backgroundColor = MyAppStyle.darkBackgroundColor
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
    
    @IBAction func didTapSuggestionButton(_ sender: UIButton) {
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
        
        cell.contentView.backgroundColor = MyAppStyle.backgroundColor
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let trailerAction = UITableViewRowAction(style: .default, title: "Trailer") {[weak self] _, indexPath in
            guard let title = self?.viewModel.fetchSearchResult(at: indexPath.row)?.title else { return }
            let destination = TrailerViewController(movieTitle: title)
            self?.navigationController?.present(destination, animated: true)
        }
        trailerAction.backgroundColor = MyAppStyle.darkBackgroundColor
        
        return [trailerAction]
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
