//
//  User.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 16/10/22.
//

import Foundation

struct UsersResponse: Decodable {
    let data: [User]
}

struct User: Decodable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
