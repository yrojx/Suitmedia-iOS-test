//
//  UserListViewController.swift
//  Suitmedia iOS test
//
//  Created by Yossan Rahmadi on 16/10/22.
//

import CoreLocation
import MapKit
import UIKit

class UserListViewController: UIViewController {

    enum UserListMode {
        case table
        case map
    }

    private var userListViewModel: UserListViewModelProtocol

    private var userlistMode: UserListMode = .table

    init(userListViewModel: UserListViewModelProtocol) {
        self.userListViewModel = userListViewModel
        super.init(nibName: nil, bundle: nil)
        self.userListViewModel.action = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Users"

        setupView()
        configureTableView()
        configureMapView()
        userListViewModel.onViewDidLoad()
    }

    func setupView() {
        view.backgroundColor = SuitmediaColor.white
        setupTableView()
    }

    func configureTableView() {
        self.tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func configureMapView() {
        mapView.setRegion(MKCoordinateRegion(center: userListViewModel.coordinates[0], span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
        mapView.delegate = self

        addCustomPin()
    }

    func setupTableView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_show_map"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        self.tableView.separatorStyle = .none
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -21),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setupMapView() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_show_list"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func addCustomPin() {
        var pins: [MKPointAnnotation] = []
        for (idx, coordinate) in userListViewModel.coordinates.enumerated() {
            let pin: MKPointAnnotation = MKPointAnnotation()
            pin.title = "\(idx)"
            pin.coordinate = coordinate
            pins.append(pin)
        }
        mapView.addAnnotations(pins)
    }

    @objc private func selectButtonTapped() {
        setDataManager()
    }

    private func setDataManager() {
        if let currentUser = userListViewModel.currentUser {
            DataManager.shared.name = "\(currentUser.firstName) \(currentUser.lastName)"
            DataManager.shared.email = currentUser.email
            DataManager.shared.avatar = currentUser.avatar
            navigationController?.popViewController(animated: true)
        }
    }

    @objc func rightBarButtonTapped() {
        switch userlistMode {
        case .table:
            setupMapView()
            tableView.removeFromSuperview()
            userlistMode = .map
            break
        case .map:
            setupTableView()
            mapView.removeFromSuperview()
            userlistMode = .table
            break
        }
    }

}

extension UserListViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        var annotationView: MKAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        } else {
            annotationView?.annotation = annotation
        }

        annotationView?.image = UIImage(named: "ic_pin_point")

        return annotationView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let title = view.annotation?.title, let idx = Int(title ?? "-1")  {
            let user: User = userListViewModel.users[idx]
            userListViewModel.currentUser = user

            if let bottomPanelView: UserListBottomPanelView = self.view.viewWithTag(9) as? UserListBottomPanelView {
                bottomPanelView.avatarImageView.load(urlString: user.avatar)
                bottomPanelView.nameLabel.text = "\(user.firstName) \(userListViewModel.users[idx].lastName)"

            } else {
                let bottomPanelView: UserListBottomPanelView = UserListBottomPanelView()
                bottomPanelView.avatarImageView.load(urlString: user.avatar)
                bottomPanelView.nameLabel.text = "\(user.firstName) \(userListViewModel.users[idx].lastName)"
                bottomPanelView.selectButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)

                bottomPanelView.translatesAutoresizingMaskIntoConstraints = false
                bottomPanelView.tag = 9
                self.view.addSubview(bottomPanelView)

                NSLayoutConstraint.activate([
                    bottomPanelView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    bottomPanelView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    bottomPanelView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
            }
        }
    }
}

extension UserListViewController: UserListViewModelAction {

    func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userListViewModel.currentUser = userListViewModel.users[indexPath.row]
        setDataManager()
    }
}

extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserTableViewCell {
            cell.nameLabel.text = "\(userListViewModel.users[indexPath.row].firstName) \(userListViewModel.users[indexPath.row].lastName)"
            cell.emailLabel.text = "\(userListViewModel.users[indexPath.row].email)"
            cell.avatarImageView.load(urlString: userListViewModel.users[indexPath.row].avatar)

            if indexPath.row == 0 {
                cell.avatarImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 33).isActive = true
            } else {
                cell.avatarImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 16).isActive = true
            }

            return cell
        }
        fatalError("could not dequeueReusableCell")
    }

}
