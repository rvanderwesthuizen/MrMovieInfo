//
//  RegisterViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        // do some logic to register user
        
        if true {
            let controller = storyboard?.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingViewController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        }
    }
}
