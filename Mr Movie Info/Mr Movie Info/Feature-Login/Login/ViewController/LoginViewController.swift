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
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var navigationDescriptionLabel: UILabel!
    @IBOutlet private weak var destinationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToRegister))
        emailTextField.becomeFirstResponder()
        registerStackView.addGestureRecognizer(tap)
    }
    
    private func styling() {
        passwordTextField.textColor = MyAppStyle.bodyTextColor
        passwordTextField.backgroundColor = MyAppStyle.darkBackgroundColor
        passwordTextField.font = MyAppStyle.bodyFont
        
        emailTextField.textColor = MyAppStyle.bodyTextColor
        emailTextField.backgroundColor = MyAppStyle.darkBackgroundColor
        emailTextField.font = MyAppStyle.bodyFont
        
        titleLabel.textColor = MyAppStyle.titleColor
        titleLabel.font = MyAppStyle.titleFont
        
        loginButton.backgroundColor = MyAppStyle.darkBackgroundColor
        loginButton.tintColor = MyAppStyle.accentColor
        loginButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        navigationDescriptionLabel.textColor = MyAppStyle.bodyTextColor
        navigationDescriptionLabel.font = MyAppStyle.bodyFont
        
        destinationLabel.textColor = MyAppStyle.headingThreeColor
        destinationLabel.font = MyAppStyle.headingThreeFont
        
        self.view.backgroundColor = MyAppStyle.backgroundColor
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
