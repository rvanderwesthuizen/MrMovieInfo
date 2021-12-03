//
//  WKInterfaceImageExtension.swift
//  WatchSuggestionsApp WatchKit Extension
//
//  Created by Ruan van der Westhuizen on 2021/12/02.
//

import Foundation
import WatchKit

extension WKInterfaceImage {
    func loadImage(urlString: String) {
        self.setImage(UIImage(named: "noImageFound"))
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.setImage(image)
                    }
                }
            }
        }
    }
}
