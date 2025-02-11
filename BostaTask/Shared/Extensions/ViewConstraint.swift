//
//  ViewConstraint.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

extension UIView {
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
    }
}
