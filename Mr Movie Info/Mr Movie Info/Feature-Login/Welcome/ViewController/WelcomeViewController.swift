//
//  WelcomeViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
