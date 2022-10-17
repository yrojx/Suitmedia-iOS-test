//
//  APIError.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 16/10/22.
//

import Foundation

enum APIError: Error {
   case invalidPath
   case decoding
}

extension APIError {
   var localizedDescription: String {
      switch self {
      case .invalidPath:
         return "Invalid Path"
      case .decoding:
         return "There was an error decoding the type"
      }
   }
}
