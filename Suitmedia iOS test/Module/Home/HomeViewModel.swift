//
//  HomeViewModel.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {

    var action: HomeViewModelAction?
    let name: String
    let welcomeText: String = "Welcome"
    let emptyUserText: String = "Select a user to show the profile"
    let websiteText: String = "website"

    init(name: String) {
        self.name = name
    }

    func onViewDidLoad() {
        action?.setupViews()
    }

    func onViewWillAppear() {
        action?.setupViewData()
    }

}
