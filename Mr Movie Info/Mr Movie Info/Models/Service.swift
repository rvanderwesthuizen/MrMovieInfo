//
//  Service.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation

class Service {
    private var dependency: omdbAPIProtocol
    
    init(dependency: omdbAPIProtocol){
        self.dependency = dependency
    }
    
    public func retrieveData(forTitle: String, completion: @escaping (Result<Any, Error>) -> Void) {
        dependency.performRequest(with: title) { result in
            do {
                let data = try result.get()
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
