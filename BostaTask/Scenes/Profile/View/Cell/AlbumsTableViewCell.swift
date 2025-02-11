//
//  AlbumsTableViewCell.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

final class AlbumsTableViewCell: UITableViewCell {

    @IBOutlet private weak var albumNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureCell(item: String) {
        albumNameLabel.text = item
    }
}
