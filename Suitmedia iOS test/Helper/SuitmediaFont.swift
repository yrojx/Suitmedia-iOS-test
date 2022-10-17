//
//  SuitmediaFont.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import UIKit

struct SuitmediaFont {

    static var boldH1: UIFont = UIFont(name: "Poppins-SemiBold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .semibold)
    
    static var boldH2: UIFont = UIFont(name: "Poppins-SemiBold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)

    static var h2: UIFont = UIFont(name: "Poppins-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)

    static var h3: UIFont = UIFont(name: "Poppins-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)

    static var buttonFont: UIFont = UIFont(name: "Poppins-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .medium)

    static var caption: UIFont = UIFont(name: "Poppins-Regular", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .regular)

    static var smallBody: UIFont = UIFont(name: "Poppins-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)

}
