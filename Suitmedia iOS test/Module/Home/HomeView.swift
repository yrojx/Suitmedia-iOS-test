//
//  HomeView.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 16/10/22.
//

import UIKit

class HomeView: UIView {

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = SuitmediaFont.smallBody
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = SuitmediaFont.boldH2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var emptyUserLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = SuitmediaColor.greyText
        label.font = SuitmediaFont.h2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = SuitmediaColor.greyText
        label.font = SuitmediaFont.boldH1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = SuitmediaColor.greyText
        label.font = SuitmediaFont.h2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let websiteAttributeString: [NSAttributedString.Key: Any] = [
        .font : SuitmediaFont.h2,
        .foregroundColor: SuitmediaColor.primary,
        .underlineStyle: NSUnderlineStyle.single.rawValue]

    lazy var websiteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_user_placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var chooseUserButton: Button = {
        let button = Button()
        button.setTitle("Choose a User", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = SuitmediaColor.white
        self.addSubview(welcomeLabel)
        self.addSubview(nameLabel)
        self.addSubview(userImageView)
        self.addSubview(emptyUserLabel)
        self.addSubview(usernameLabel)
        self.addSubview(emailLabel)
        self.addSubview(websiteButton)
        self.addSubview(chooseUserButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -21),
            welcomeLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 13),
        ])

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -21),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 107),
            userImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -105),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
            userImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 94),
        ])

        NSLayoutConstraint.activate([
            emptyUserLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 37),
            emptyUserLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            emptyUserLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 35),
        ])

        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 37),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            usernameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 53),
        ])

        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 37),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 8),
        ])

        NSLayoutConstraint.activate([
            websiteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 37),
            websiteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            websiteButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            chooseUserButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 29),
            chooseUserButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -37),
            chooseUserButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
        ])
    }

}
