//
//  LoginViewModel.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {

    var action: LoginViewModelAction?

    var nameText: String = ""
    var palindromeText: String = ""

    func checkPalindrome() {
        if palindromeText.count > 1 {
            let whitespaceRemovedText: String = palindromeText.filter { !$0.isWhitespace }
            let reversedText: String = String(whitespaceRemovedText.reversed())

            action?.setupPalindromeResultView(correct: whitespaceRemovedText == reversedText)
        }
    }

    func onNextButtonTapped() {
        let homeVM = HomeViewModel(name: nameText)
        let homeVC = HomeViewController(homeViewModel: homeVM)
        action?.navigateToHome(homeVC: homeVC)
    }
    
}
