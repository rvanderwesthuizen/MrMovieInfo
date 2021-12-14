//
//  WelcomeViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
    }
    
    private func styling() {
        titleLabel.textColor = MyAppStyle.titleColor
        titleLabel.font = MyAppStyle.titleFont
        
        descriptionLabel.textColor = MyAppStyle.bodyTextColor
        descriptionLabel.font = MyAppStyle.descriptionFont
        
        loginButton.backgroundColor = MyAppStyle.darkBackgroundColor
        loginButton.tintColor = MyAppStyle.accentColor
        loginButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        registerButton.backgroundColor = MyAppStyle.backgroundColor
        registerButton.tintColor = MyAppStyle.accentColor
        registerButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        self.view.backgroundColor = MyAppStyle.backgroundColor
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var controller: UIViewController
        if sender.tag == 1 {
            controller = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        } else {
            controller = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        }
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
}
