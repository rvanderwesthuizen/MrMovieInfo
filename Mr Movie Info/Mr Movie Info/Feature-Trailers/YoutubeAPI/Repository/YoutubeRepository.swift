//
//  YoutubeRepository.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/24.
//

import Foundation

class YoutubeRepository: YoutubeRepositable {
    func fetchVideoIDUsing(title: String, completion: @escaping youtubeRepositoryResponseBlock) {
        let urlString = "\(Constants.baseYoutubeURL)\(title)+trailer"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(error!))
            }
            do {
                let result = try JSONDecoder().decode(YouTubeModel.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(result.items[0].id.videoId))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
