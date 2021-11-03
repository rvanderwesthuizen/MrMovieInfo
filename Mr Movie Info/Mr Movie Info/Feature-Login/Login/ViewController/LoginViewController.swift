//
//  LoginViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var registerStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToRegister))
        registerStackView.addGestureRecognizer(tap)
    }
    
    @objc func navigateToRegister() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //do some logic to login
        
        if true {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        }
    }
}
