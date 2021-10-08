//
//  ViewModelDelegate.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func refreshViewContent()
    func didFailWithError(error: Error)
}
