//
//  LoginViewController.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    private var loginView: LoginView = LoginView()
    private var loginViewModel: LoginViewModelProtocol

    init(loginViewModel: LoginViewModelProtocol) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
        self.loginViewModel.action = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: SuitmediaColor.primary]
        navigationController?.navigationBar.tintColor = SuitmediaColor.primary
        navigationController?.navigationBar.barTintColor = SuitmediaColor.white
        setupViews()
    }

    private func setupViews() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        loginView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        loginView.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        loginView.nameTextField.addTarget(self, action: #selector(nameTextFieldChanged), for: .editingChanged)
        loginView.nameTextField.delegate = self
        loginView.palindromeTextField.addTarget(self, action: #selector(palindromeTextFieldChanged), for: .editingChanged)
        loginView.palindromeTextField.delegate = self
    }

    @objc func checkButtonTapped() {
        loginViewModel.checkPalindrome()
    }

    @objc func nextButtonTapped() {
        loginViewModel.onNextButtonTapped()
    }

    @objc func nameTextFieldChanged(_ textField: UITextField) {
        if let text = textField.text {
            loginViewModel.nameText = text
            loginView.nextButton.alpha = text.isEmpty ? 0.5 : 1
            loginView.nextButton.isEnabled = !text.isEmpty
        }
    }

    @objc func palindromeTextFieldChanged(_ textField: UITextField) {
        if let text = textField.text {
            loginViewModel.palindromeText = text
            loginView.checkButton.alpha = text.count > 1 ? 1 : 0.5
            loginView.checkButton.isEnabled = text.count > 1
        }

    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginView.nameTextField {
            loginView.palindromeTextField.becomeFirstResponder()
        } else if textField == loginView.palindromeTextField {
            textField.resignFirstResponder()
        }

        return true
    }
}

extension LoginViewController: LoginViewModelAction {

    func setupPalindromeResultView(correct: Bool) {
        let text: String = correct ? "It is Palindrome" : "It is not Palindrome"

        let alert: UIAlertController = UIAlertController(title: "Palindrome Check", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

    func navigateToHome(homeVC: HomeViewController) {
        navigationController?.pushViewController(homeVC, animated: true)
    }

}

