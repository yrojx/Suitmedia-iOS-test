//
//  HomeViewModelContract.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 16/10/22.
//

import Foundation

protocol HomeViewModelProtocol {
    var action: HomeViewModelAction? { get set }
    var name: String { get }
    var welcomeText: String { get }
    var emptyUserText: String { get }
    var websiteText: String { get }

    func onViewDidLoad()
    func onViewWillAppear()
}

protocol HomeViewModelAction {
    func setupViews()
    func setupViewData()
}
