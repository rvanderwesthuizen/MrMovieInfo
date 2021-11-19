//
//  OnboardingCollectionViewCell.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/27.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var slideImageView: UIImageView!
    @IBOutlet private weak var slideTitleLabel: UILabel!
    @IBOutlet private weak var slideDescriptionLabel: UILabel!
    
    static let identifier = "OnboardingCollectionViewCell"
    static let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
    
    func configure(with slide: OnboardingSlide) {
        slideImageView.contentMode = .scaleAspectFit
        slideImageView.image = slide.image
        populateAndStyle(slideTitleLabel, font: MyAppStyle.onboardingTitleFont, color: MyAppStyle.onboardingTitleColor, text: slide.title)
        populateAndStyle(slideDescriptionLabel, font: MyAppStyle.bodyFont, color: MyAppStyle.bodyTextColor, text: slide.description)
    }
    
    func populateAndStyle(_ label: UILabel, font: UIFont, color: UIColor, text: String) {
        label.text = text
        label.textColor = color
        label.font = font
    }
}
