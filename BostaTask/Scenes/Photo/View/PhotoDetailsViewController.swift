//
//  PhotoDetailsViewController.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

final class PhotoDetailsViewController: UIViewController {
    
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var albumImage: UIImageView!
    
    private var imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        albumImage.loadImage(for: imageUrl)
        addNavigationShareButton()
        setupScrollView()
    }
    
    private func addNavigationShareButton() {
        let shareButton = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShareImage)
        )
        navigationItem.rightBarButtonItem = shareButton
    }
    
    @objc
    private func didTapShareImage() {
        shareImage(with: albumImage)
    }
}

extension PhotoDetailsViewController: UIScrollViewDelegate {
    
    private func setupScrollView() {
        contentScrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        albumImage
    }
}
