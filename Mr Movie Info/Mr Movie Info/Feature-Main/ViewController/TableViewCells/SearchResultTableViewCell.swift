//
//  SearchResultTableViewCell.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/08.
//

import UIKit
import SearchMDFramework

class SearchResultTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var swipeInfoLabel: UILabel!
    
    static let identifier = "SearchResultTableViewCell"
    static let nib = UINib(nibName: "SearchResultTableViewCell", bundle: nil)
    
    public func configure(with model: Search) {
        populateAndStyleLabel(swipeInfoLabel, font: MyAppStyle.smallBodyFont, color: MyAppStyle.bodyTextColor, text: "Swipe left to view trailer")
        populateAndStyleLabel(titleLabel, font: MyAppStyle.headingThreeFont, color: MyAppStyle.bodyTextColor, text: model.title)
        populateAndStyleLabel(typeLabel, font: MyAppStyle.smallBodyFont, color: MyAppStyle.bodyTextColor, text: model.type)
        populateAndStyleLabel(yearLabel, font: MyAppStyle.smallBodyFont, color: MyAppStyle.bodyTextColor, text: model.year)
        posterImageView.loadImage(urlString: model.poster)
    }
    
    public func configure(with model: MovieDetails) {
        populateAndStyleLabel(swipeInfoLabel, font: MyAppStyle.smallBodyFont, color: MyAppStyle.bodyTextColor, text: "Swipe left for more options")
        populateAndStyleLabel(titleLabel, font: MyAppStyle.headingThreeFont, color: MyAppStyle.bodyTextColor, text: model.title)
        populateAndStyleLabel(typeLabel, font: MyAppStyle.smallBodyFont, color: MyAppStyle.bodyTextColor, text: model.type)
        populateAndStyleLabel(yearLabel, font: MyAppStyle.smallBodyFont, color: MyAppStyle.bodyTextColor, text: model.year)
        posterImageView.loadImage(urlString: model.poster)
    }
    
    private func populateAndStyleLabel(_ label: UILabel,font: UIFont, color: UIColor, text: String) {
        label.text = text
        label.font = font
        label.textColor = color
    }
}
