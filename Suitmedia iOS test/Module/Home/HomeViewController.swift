//
//  HomeViewController.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 15/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    private var homeView: HomeView = HomeView()
    private var homeViewModel: HomeViewModelProtocol

    init(homeViewModel: HomeViewModelProtocol) {
        self.homeViewModel = homeViewModel
        super.init(nibName: nil, bundle: nil)
        self.homeViewModel.action = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        homeViewModel.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        homeViewModel.onViewWillAppear()
    }

    override func viewDidLayoutSubviews() {
        homeView.userImageView.makeRounded()
    }

    @objc private func websiteButtonTapped() {
        navigationController?.pushViewController(SuitmediaWebViewController(), animated: true)
    }

    @objc private func chooseUserTapped() {
        navigationController?.pushViewController(UserListViewController(userListViewModel: UserListViewModel()), animated: true)
    }

}

extension HomeViewController: HomeViewModelAction {

    func setupViews() {
        homeView.welcomeLabel.text = homeViewModel.welcomeText
        homeView.nameLabel.text = homeViewModel.name
        homeView.emptyUserLabel.text = homeViewModel.emptyUserText
        let welcomeAttributedString = NSAttributedString(string: homeViewModel.websiteText, attributes: homeView.websiteAttributeString)
        homeView.websiteButton.setAttributedTitle(welcomeAttributedString, for: .normal)

        homeView.websiteButton.addTarget(self, action: #selector(websiteButtonTapped), for: .touchUpInside)
        homeView.chooseUserButton.addTarget(self, action: #selector(chooseUserTapped), for: .touchUpInside)

        homeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeView)

        NSLayoutConstraint.activate([
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupViewData() {
        if DataManager.shared.name.isEmpty {
            homeView.usernameLabel.isHidden = true
            homeView.emailLabel.isHidden = true
            homeView.websiteButton.isHidden = true

            homeView.emptyUserLabel.isHidden = false
        } else {
            homeView.emptyUserLabel.isHidden = true

            homeView.usernameLabel.text = DataManager.shared.name
            homeView.emailLabel.text = DataManager.shared.email
            homeView.userImageView.load(urlString: DataManager.shared.avatar)
            homeView.usernameLabel.isHidden = false
            homeView.emailLabel.isHidden = false
            homeView.websiteButton.isHidden = false
        }
    }
    
}
