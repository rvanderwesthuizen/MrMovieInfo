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
        UIColor(red: 97, green: 97, blue: 97, alpha: 1)
    }
    
    static var textColor: UIColor {
        UIColor(red: 189, green: 189, blue: 189, alpha: 1)
    }
    
    static var darkPrimaryColor: UIColor {
        return UIColor(red: 45, green: 45, blue: 45, alpha: 1)
    }
    
    static var myOrangeColor: UIColor {
        UIColor(red: 255, green: 154, blue: 3, alpha: 1)
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
    
    static var smallText: UIFont {
        UIFont.systemFont(ofSize: 13)
    }
    
    static var paragraph: UIFont {
        UIFont.systemFont(ofSize: 15)
    }
}
