//
//  ProfileViewController.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var albumsTableView: UITableView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userAddressLabel: UILabel!
    
    private var cancellable = Cancellable()
    private lazy var viewModel: ProfileViewModel = {
        ProfileViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationTitle()
    }
    
    private func setupViews() {
        setupTableView()
        subscribe()
        getData()
    }
    
    private func setNavigationTitle() {
        setNavigationBarTitle(title: "Profile", withLargeTitle: true)
    }
}

extension ProfileViewController: TableViewConfig {
    
    private func setupTableView() {
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
        albumsTableView.register(cellClass: AlbumsTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(with: AlbumsTableViewCell.self, for: indexPath)
        cell.configureCell(item: viewModel.albums[indexPath.row].title ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = viewModel.albums[indexPath.row]
        let vc = AlbumDetailsViewController(
            albumId: album.id ?? 0,
            albumTitle: album.title ?? ""
        )
        push(vc)
    }
}

extension ProfileViewController {
    
    private func subscribe() {
        userDataSubscribe()
        albumsSubscribe()
    }
    
    private func userDataSubscribe() {
        viewModel.$userData
            .sink { [weak self] userData in
                guard let self,
                      let userData = userData,
                      let address = userData.address else { return }
                userNameLabel.text = userData.name
                userAddressLabel.text = "\(address.street ?? ""), \(address.suite ?? ""), \(address.city ?? ""), \(address.zipcode ?? "")"
            }
            .store(in: &cancellable)
    }
    
    private func albumsSubscribe() {
        viewModel.$albums
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                albumsTableView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    private func getData() {
        viewModel.getUsersRequest()
    }
}
