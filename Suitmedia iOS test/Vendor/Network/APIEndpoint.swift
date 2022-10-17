//
//  ApiEndpoint.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 16/10/22.
//

import Foundation

enum APIEndpoint {

    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
    }

    case getUsers
}

extension APIEndpoint {

    var path: String {
        switch self {

        case .getUsers:
            return "/users"
        }
    }

    var method: APIEndpoint.Method {
        switch self {
        default:
            return .GET
        }
    }

    var parameters: [URLQueryItem]? {
        switch self {
        case .getUsers:
            var queryItems = [URLQueryItem]()
            queryItems.append(URLQueryItem(name: "page", value: "1"))
            queryItems.append(URLQueryItem(name: "per_page", value: "10"))
            return queryItems
        }
    }
}
