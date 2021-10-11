//
//  UIImageViewExtension.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/08.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        self.image = UIImage(systemName: "ellipsis.circle")
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
