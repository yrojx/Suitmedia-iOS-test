//
//  UserListViewModel.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import CoreLocation
import Foundation

class UserListViewModel: UserListViewModelProtocol {

    var action: UserListViewModelAction?

    var currentUser: User?
    var users: [User] = []

    let coordinates: [CLLocationCoordinate2D] = [
        CLLocationCoordinate2D(latitude: -7.823268, longitude: 110.3711534),
        CLLocationCoordinate2D(latitude: -7.820886, longitude: 110.3711179),
        CLLocationCoordinate2D(latitude: -7.820694, longitude: 110.3687322),
        CLLocationCoordinate2D(latitude: -7.821273, longitude: 110.3669239),
        CLLocationCoordinate2D(latitude: -7.822696, longitude: 110.3649465),
        CLLocationCoordinate2D(latitude: -7.821846, longitude: 110.3677793),
        CLLocationCoordinate2D(latitude: -7.823525, longitude: 110.3680473),
        CLLocationCoordinate2D(latitude: -7.820660, longitude: 110.3697553),
        CLLocationCoordinate2D(latitude: -7.820958, longitude: 110.3702693),
        CLLocationCoordinate2D(latitude: -7.822513, longitude: 110.3687255),
    ]

    func onViewDidLoad() {
        Task {
            await getUsers()
            action?.updateTableView()
        }

    }

    private func getUsers() async {
        do {
            let response: UsersResponse = try await APIManager.shared.getData(from: .getUsers)
            users = response.data
        } catch {
            print(String(describing: error))
        }
    }
}
