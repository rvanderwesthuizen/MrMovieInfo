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
    let awards: String
    let poster: String
    let imdbRating: String
    let imdbID: String
    let boxOffice: String
    let type: String
    let productionStudio: String
    
    init(title: String, year: String, rated: String, released: String, runtime: String, genre: String, director: String, writer: String, actors: String, plot: String, language: String, awards: String, poster: String, imdbRating: String, imdbID: String, boxOffice: String, type: String, productionStudio : String) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.awards = awards
        self.poster = poster
        self.imdbRating = imdbRating
        self.imdbID = imdbID
        self.boxOffice = boxOffice
        self.type = type
        self.productionStudio = productionStudio
    }
    
    var dictionary: [String: String] {
        return ["Title": title,
                "Year": year,
                "Rated": rated,
                "Runtime": runtime,
                "Released": released,
                "Genre": genre,
                "Director": director,
                "Writer": writer,
                "Actors": actors,
                "Plot": plot,
                "Language": language,
                "Awards": awards,
                "Poster": poster,
                "imdbRating": imdbRating,
                "imdbID": imdbID,
                "Type": type,
                "Production": productionStudio,
                "BoxOffice": boxOffice
                ]
    }
    
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
        case awards = "Awards"
        case poster = "Poster"
        case imdbRating
        case imdbID
        case type = "Type"
        case productionStudio = "Production"
        case boxOffice = "BoxOffice"
    }
}
