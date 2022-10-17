//
//  Button.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import UIKit

class Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 12
        setTitleColor(SuitmediaColor.white, for: .normal)
        setTitleColor(SuitmediaColor.white, for: .disabled)
        backgroundColor = SuitmediaColor.primary
        titleLabel?.font = SuitmediaFont.buttonFont

        var styleConfig = UIButton.Configuration.plain()
        styleConfig.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 85, bottom: 12, trailing: 85)
        configuration = styleConfig
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
