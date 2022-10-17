//
//  UserListBottomPanelView.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import UIKit

class UserListBottomPanelView: UIView {
    
    lazy var avatarImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = SuitmediaFont.h3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var selectButton: Button = {
        let button: Button = Button()
        button.setTitle("Select", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        avatarImageView.makeRounded()
    }

    private func setupViews() {
        backgroundColor = SuitmediaColor.white
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
        self.addSubview(selectButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 146),
            avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -146),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 15),
        ])

        NSLayoutConstraint.activate([
            selectButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 33),
            selectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            selectButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 33),
            selectButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -26)
        ])
    }
}
