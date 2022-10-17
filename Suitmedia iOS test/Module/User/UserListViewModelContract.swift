//
//  UserListViewModelContract.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import CoreLocation
import Foundation

protocol UserListViewModelProtocol {
    var action: UserListViewModelAction? { get set }

    var currentUser: User? { get set }
    var users: [User] { get }
    var coordinates: [CLLocationCoordinate2D] { get }

    func onViewDidLoad()
}

protocol UserListViewModelAction {
    func updateTableView()
}
