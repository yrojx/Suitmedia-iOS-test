//
//  UserTableViewCell.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 17/10/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ic_user_placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = SuitmediaFont.h3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = SuitmediaFont.caption
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bottomSeparatorLine: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = SuitmediaColor.lightSeparator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

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
        self.addSubview(avatarImageView)
        self.addSubview(nameLabel)
        self.addSubview(emailLabel)
        self.addSubview(bottomSeparatorLine)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            avatarImageView.bottomAnchor.constraint(equalTo: self.bottomSeparatorLine.topAnchor, constant: -15),
            avatarImageView.heightAnchor.constraint(equalToConstant: 49),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])


        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 18),
            nameLabel.bottomAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4)
        ])

        NSLayoutConstraint.activate([
            bottomSeparatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomSeparatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bottomSeparatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomSeparatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

}
