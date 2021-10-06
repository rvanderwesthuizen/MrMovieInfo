//
//  ViewModelDelegate.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation

protocol ViewModelDelegate {
    func didRetrieveData()
    func didFailWithError(error: Error)
}
