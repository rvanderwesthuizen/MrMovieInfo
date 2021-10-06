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
        // Do any additional setup after loading the view.
        
        viewModel.retrieveData(forTitle: "Thor")
    }
}

extension MainTableViewController: ViewModelDelegate {
    func didRetrieveData() {
        print(viewModel.searchResults!)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
