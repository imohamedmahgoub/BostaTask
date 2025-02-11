//
//  PhotosCollectionViewCell.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(imageLink: String) {
        albumImage.loadImage(for: imageLink)
    }
}
