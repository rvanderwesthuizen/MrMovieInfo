//
//  Repositable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation


typealias repositoryResponseBlock = ((Result<SearchModel,Error>) -> Void)

protocol SearchRepositable {
    func performRequestWith(title: String, pageNumber: Int, completion: @escaping repositoryResponseBlock)
}
