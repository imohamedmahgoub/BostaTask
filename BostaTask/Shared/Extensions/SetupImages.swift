//
//  SetupImages.swift
///  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    private var setupLoader: UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .blackColor
        activityIndicatorView.isHidden = false
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }
    
    func loadImage(for linkString: String?, _ placeholder: UIImage? = UIImage(named: "placeholder.png")) {
        let activityIndicatorView = setupLoader
        let options: [KingfisherOptionsInfoItem] = [.cacheOriginalImage, .scaleFactor(0.5)]
        
        guard let linkString,
                let url = URL(string: linkString) else { return }
        
        kf.setImage(with: url, placeholder: placeholder, options: options) { [weak self] result in
            guard let self else { return }
            activityIndicatorView.removeFromSuperview()
            switch result {
            case .success(let image):
                self.image = image.image
            case .failure:
                self.image = placeholder
            }
        }
    }
}
