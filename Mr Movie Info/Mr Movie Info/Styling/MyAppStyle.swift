//
//  MyAppStyle.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/18.
//

import Foundation

@objcMembers class MyAppStyle: NSObject {
    //MARK: - Color
    static let titleColor = UIColor.textColor
    static let onboardingTitleColor = UIColor.darkPrimaryColor
    static let headingThreeColor = UIColor.darkPrimaryColor
    static let accentColor = UIColor.myOrangeColor
    static let darkBackgroundColor = UIColor.darkPrimaryColor
    static let backgroundColor = UIColor.primaryColor
    static let bodyTextColor = UIColor.textColor
    
    //MARK: - Font
    static let titleFont = UIFont.myTitleFont
    static let bodyFont = UIFont.paragraph
    static let smallBodyFont = UIFont.smallText
    static let buttonTextFont = UIFont.paragraph
    static let headingThreeFont = UIFont.headingThreeSemiBold
    static let onboardingTitleFont = UIFont.headingOne
    static let descriptionFont = UIFont.headingTwo
    static let movieDetailsTitleFont = UIFont.headingTwoBold
    static let movieDetailsParagraphHeadingsFont = UIFont.headingThreeBold
    static let movieDetailsParagraphFont = UIFont.largeText
}
