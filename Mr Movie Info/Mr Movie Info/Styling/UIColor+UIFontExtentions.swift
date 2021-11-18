//
//  UIColor+UIFontExtentions.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/18.
//

import Foundation
import UIKit

extension UIColor {
    static var primaryColor: UIColor {
        UIColor(named: "PrimaryColor") ?? .white
    }
    
    static var textColor: UIColor {
        UIColor(named: "PrimaryTextColor") ?? .label
    }
    
    static var darkPrimaryColor: UIColor {
        UIColor(named: "DarkPrimaryColor") ?? .black
    }
    
    static var myOrangeColor: UIColor {
        UIColor(named: "AccentColor") ?? .systemBlue
    }
}

extension UIFont {
    static var myTitleFont: UIFont {
        UIFont.systemFont(ofSize: 50, weight: .medium)
    }
    
    static var headingOne: UIFont {
        UIFont.systemFont(ofSize: 31)
    }
    
    static var headingTwo: UIFont {
        UIFont.systemFont(ofSize: 20)
    }
    
    static var headingTwoBold: UIFont {
        UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    static var headingThreeBold: UIFont {
        UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
    static var headingThreeSemiBold: UIFont {
        UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    static var largeText: UIFont {
        UIFont.systemFont(ofSize: 16)
    }
    
    static var smallText: UIFont {
        UIFont.systemFont(ofSize: 13)
    }
    
    static var paragraph: UIFont {
        UIFont.systemFont(ofSize: 15)
    }
}
