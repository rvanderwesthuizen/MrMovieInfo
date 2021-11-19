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
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var navigationDescriptionLabel: UILabel!
    @IBOutlet private weak var destinationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styling()
        let tap = UITapGestureRecognizer(target: self, action: #selector(navigateToRegister))
        LoginStackView.addGestureRecognizer(tap)
    }
    
    private func styling() {
        emailTextField.textColor = MyAppStyle.bodyTextColor
        emailTextField.backgroundColor = MyAppStyle.darkBackgroundColor
        emailTextField.font = MyAppStyle.bodyFont
        
        passwordTextField.textColor = MyAppStyle.bodyTextColor
        passwordTextField.backgroundColor = MyAppStyle.darkBackgroundColor
        passwordTextField.font = MyAppStyle.bodyFont
        
        titleLabel.textColor = MyAppStyle.titleColor
        titleLabel.font = MyAppStyle.titleFont
        
        registerButton.tintColor = MyAppStyle.accentColor
        registerButton.backgroundColor = MyAppStyle.darkBackgroundColor
        registerButton.titleLabel?.font = MyAppStyle.buttonTextFont
        
        navigationDescriptionLabel.textColor = MyAppStyle.bodyTextColor
        navigationDescriptionLabel.font = MyAppStyle.bodyFont
        
        destinationLabel.textColor = MyAppStyle.headingThreeColor
        destinationLabel.font = MyAppStyle.headingThreeFont
        
        self.view.backgroundColor = MyAppStyle.backgroundColor
    }
    
    @objc private func navigateToRegister() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    @IBAction private func registerButtonTapped(_ sender: UIButton) {
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
