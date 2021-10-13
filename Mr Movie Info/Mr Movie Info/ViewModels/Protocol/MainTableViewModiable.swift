//
//  MainTableViewModiable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/13.
//

import Foundation

protocol MainTableViewModiable {
    func retrieveData(forTitle title: String)
    func loadNextPage(forTitle title: String)
    var numberOfRows: Int { get }
    func fetchSearchResult(at index: Int) -> Search?
}
