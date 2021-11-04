//
//  LoginViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var viewModel = LoginViewModel(repository: FirebaseAuthRepository(), delegate: self)

    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var registerStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToRegister))
        registerStackView.addGestureRecognizer(tap)
    }
    
    @objc private func navigateToRegister() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
                viewModel.loginUser(withEmail: email, password: password)
        } else {
            showAlert(alertTitle: "No email/password provided", alertMessage: "Please provide an email and password", actionTitle: "OK")
        }
    }
}

extension LoginViewController: ViewModelDelegate {
    func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    func didFailWithError(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "OK")
    }
}
