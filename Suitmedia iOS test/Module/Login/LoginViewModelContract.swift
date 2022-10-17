//
//  LoginViewModelContract.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import Foundation

protocol LoginViewModelProtocol {
    var action: LoginViewModelAction? { get set }
    var nameText: String { get set }
    var palindromeText: String { get set }

    func checkPalindrome()
    func onNextButtonTapped()
}

protocol LoginViewModelAction {
    func setupPalindromeResultView(correct: Bool)
    func navigateToHome(homeVC: HomeViewController)
}
