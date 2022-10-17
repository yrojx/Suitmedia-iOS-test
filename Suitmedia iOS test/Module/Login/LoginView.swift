//
//  LoginView.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import UIKit

class LoginView: UIView {

    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode =  .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "background")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_photo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Name"
        textField.backgroundColor = SuitmediaColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var palindromeTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Palindrome"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.backgroundColor = SuitmediaColor.white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var checkButton: Button = {
        let button = Button()
        button.alpha = 0.5
        button.isEnabled = false
        button.setTitle("Check", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var nextButton: Button = {
        let button = Button()
        button.alpha = 0.5
        button.isEnabled = false
        button.setTitle("Next", for: .normal)
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

    // MARK: - Private Function

    private func setupViews() {
        backgroundImageView.center = self.center
        self.addSubview(backgroundImageView)
        self.addSubview(photoImageView)
        self.addSubview(nameTextField)
        self.addSubview(palindromeTextField)
        self.addSubview(checkButton)
        self.addSubview(nextButton)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 132),
            photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -127),
            photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 142),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            nameTextField.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 58),
        ])

        NSLayoutConstraint.activate([
            palindromeTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            palindromeTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            palindromeTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 22),
        ])

        NSLayoutConstraint.activate([
            checkButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            checkButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            checkButton.topAnchor.constraint(equalTo: palindromeTextField.bottomAnchor, constant: 45),
        ])

        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33),
            nextButton.topAnchor.constraint(equalTo: checkButton.bottomAnchor, constant: 15),
        ])
    }

}
