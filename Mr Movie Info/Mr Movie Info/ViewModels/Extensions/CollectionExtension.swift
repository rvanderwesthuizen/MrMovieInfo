//
//  CollectionExtention.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/07.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
