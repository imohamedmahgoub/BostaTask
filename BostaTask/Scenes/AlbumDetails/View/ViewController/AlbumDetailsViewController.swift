//
//  AlbumDetailsViewController.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

final class AlbumDetailsViewController: UIViewController {
    
    @IBOutlet private weak var albumNameLabel: UILabel!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var photosCollectionView: UICollectionView!
    
    private var albumId: Int
    private var albumTitle: String
    private var cancellable = Cancellable()
    
    private lazy var viewModel: AlbumDetailsViewModel = {
        AlbumDetailsViewModel()
    }()
    
    init(albumId: Int, albumTitle: String) {
        self.albumId = albumId
        self.albumTitle = albumTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNavigationTitle()
    }
    
    private func setupViews() {
        setupCollectionView()
        setAlbumName()
        subscribe()
        getData()
        setupTextField()
    }
    
    private func setNavigationTitle() {
        setNavigationBarTitle(title: "Album Details", withLargeTitle: false)
    }
    
    private func setAlbumName() {
        albumNameLabel.text = albumTitle
    }
}

extension AlbumDetailsViewController: CollectionViewConfig, UICollectionViewDelegateFlowLayout {
    
    private func setupCollectionView() {
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        photosCollectionView.register(cellClass: PhotosCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(with: PhotosCollectionViewCell.self, for: indexPath)
        cell.configureCell(imageLink: viewModel.photos[indexPath.row].thumbnailURL ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoDetailsViewController(imageUrl: viewModel.photos[indexPath.row].thumbnailURL ?? "")
        push(vc)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3, height: 140)
    }
}

extension AlbumDetailsViewController {
    
    private func subscribe() {
        viewModel.$photos
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self else { return }
                photosCollectionView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    private func getData() {
        viewModel.getPhotosRequest(albumId: albumId)
    }
}

extension AlbumDetailsViewController: UITextFieldDelegate {
    private func setupTextField() {
        searchTextField.delegate = self
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let searchText = searchTextField.text else { return }
        viewModel.searchWithTitle(searchText)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
