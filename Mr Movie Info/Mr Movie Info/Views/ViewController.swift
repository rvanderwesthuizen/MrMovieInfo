//
//  ViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import UIKit

class ViewController: UIViewController {

    let service = Service(manager: SearchManager())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //testing
        service.retrieveData(title: "Thor") { result in
            do {
                let response = try result.get() as! SearchModel
                print(response)
                response.results[0].title
            } catch {
                print(error)
            }
        }
    }
}

