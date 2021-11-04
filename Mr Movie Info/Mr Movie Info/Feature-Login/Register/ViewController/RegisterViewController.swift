//
//  RegisterViewController.swift
//  Mr Movie Info
//
//  Created by Ruan van der Westhuizen on 2021/11/03.
//

import UIKit

class RegisterViewController: UIViewController {
    private lazy var viewModel = RegisterViewModel(repository: FirebaseAuthRepository(), delegate: self)
    
    @IBOutlet private weak var LoginStackView: UIStackView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToRegister))
        LoginStackView.addGestureRecognizer(tap)
    }
    
    @objc private func navigateToRegister() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            viewModel.registerNewUser(withEmail: email, password: password)
        } else {
            showAlert(alertTitle: "No email/password provided", alertMessage: "Please provide an email and password", actionTitle: "OK")
        }
    }
}

extension RegisterViewController: ViewModelDelegate {
    func refreshViewContent(navigateToMovieDetailsFlag: Bool) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true)
    }
    
    func didFailWithError(error: Error) {
        showAlert(alertTitle: "Error", alertMessage: error.localizedDescription, actionTitle: "OK")
    }
}
