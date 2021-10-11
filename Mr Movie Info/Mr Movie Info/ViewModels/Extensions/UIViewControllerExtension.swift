//
//  UIViewControllerExtension.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/10/08.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String) {
        let alert = UIAlertController(title: alertTitle,
                                      message: alertMessage,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        DispatchQueue.main.async {
            self.show(alert, sender: nil)
        }
    }
}
