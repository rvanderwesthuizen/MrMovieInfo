//
//  ViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import UIKit

class MainTableViewController: UITableViewController {

    private lazy var viewModel = MainTableViewModel(repository: SearchRepository(), delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.retrieveData(forTitle: "Thor")
    }
}

extension MainTableViewController: ViewModelDelegate {
    func refreshViewContent(_ searchResults: SearchModel) {
        print(searchResults)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
