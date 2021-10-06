//
//  Repositable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/06.
//

import Foundation


typealias repositoryResponseBlock = ((Result<Any,Error>) -> Void)

protocol Repositable {
    func performRequest(with title: String, completion: @escaping repositoryResponseBlock)
}
