//
//  SearchResultTableViewCell.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/08.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!

    static let identifier = "SearchResultTableViewCell"
    static let nib = UINib(nibName: "SearchResultTableViewCell", bundle: nil)
    
    public func configure(with model: Search) {
        titleLabel.text = model.title
        typeLabel.text = model.type
        yearLabel.text = model.year
        posterImageView.loadImage(urlString: model.poster)
    }
    
    public func configure(with model: MovieDetails) {
        titleLabel.text = model.title
        typeLabel.text = model.type
        yearLabel.text = model.year
        posterImageView.loadImage(urlString: model.poster)
    }
}
