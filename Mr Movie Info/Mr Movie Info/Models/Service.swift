//
//  Service.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation
import UIKit

class Service {
    private var manager: omdbAPIProtocol
    
    init(manager: omdbAPIProtocol){
        self.manager = manager
    }
    
    public func retrieveData(title: String, completion: @escaping (Result<Any, Error>) -> Void) {
        manager.performRequest(with: title) { result in
            do {
                let data = try result.get()
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
