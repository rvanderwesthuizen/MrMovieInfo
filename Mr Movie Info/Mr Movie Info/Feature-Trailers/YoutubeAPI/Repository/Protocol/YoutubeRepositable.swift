//
//  YoutubeRepositable.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/24.
//

import Foundation

typealias youtubeRepositoryResponseBlock = ((Result<String,Error>) -> Void)

protocol YoutubeRepositable {
    func fetchVideoIDUsing(title: String, completion: @escaping youtubeRepositoryResponseBlock)
}
