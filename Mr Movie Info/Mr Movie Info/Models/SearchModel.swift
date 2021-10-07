//
//  SearchResultModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation

struct SearchModel: Codable {
    let results: [Search]
    private let totalResults: String
    
    var numberOfPages: Int {
        (Int(totalResults) ?? 0) / 10
    }
    
    private enum CodingKeys: String, CodingKey {
        case results = "Search"
        case totalResults
    }
}

struct Search: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
