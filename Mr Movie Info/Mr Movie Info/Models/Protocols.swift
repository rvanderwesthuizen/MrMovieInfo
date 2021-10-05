//
//  Protocols.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation

protocol omdbAPIProtocol {
    func performRequest(with title: String, completion: @escaping (Result<Any,Error>)-> Void )
}
