//
//  TextField.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import UIKit

class TextField: UITextField {

    let padding = UIEdgeInsets(top: 8, left: 20, bottom: 8, right: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)

        let attributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor: SuitmediaColor.placeHolder,
            NSAttributedString.Key.font: SuitmediaFont.h3
        ]

        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: attributes)
        layer.cornerRadius = 12
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
