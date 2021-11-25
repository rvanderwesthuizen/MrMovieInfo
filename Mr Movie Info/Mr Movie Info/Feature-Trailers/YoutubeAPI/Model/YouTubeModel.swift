//
//  YouTubeModel.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/24.
//

import Foundation

struct YouTubeModel: Codable {
    var items: [Item]
}

struct Item: Codable {
    var id: ID
}

struct ID: Codable {
    var videoId: String
}
