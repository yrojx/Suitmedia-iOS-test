//
//  UIImageView+loadWithUrl.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import UIKit

extension UIImageView {

    func load(urlString: String) {
        if let url: URL = URL(string: urlString) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }

    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }

}
