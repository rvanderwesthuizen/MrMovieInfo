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
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
