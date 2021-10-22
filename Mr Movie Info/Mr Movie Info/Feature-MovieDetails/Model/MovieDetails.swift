//
//  MovieDetails.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/05.
//

import Foundation

@objcMembers class MovieDetails: NSObject, Codable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: String
    let ratings: [Bullshit]
    let imdbRating: String
    let imdbID: String
    let type: String
    let boxOffice: String
    let productionStudio: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case imdbRating
        case imdbID
        case type = "Type"
        case productionStudio = "Production"
        case boxOffice = "BoxOffice"
    }
}

struct Bullshit: Codable {
    let source: String
    let value: String
    
    private enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
