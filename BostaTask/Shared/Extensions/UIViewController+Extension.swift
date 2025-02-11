//
//  UIViewController+Extension.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

extension UIViewController {
    
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func isNavigationHidden(_ status: Bool) {
        navigationController?.isNavigationBarHidden = status
    }
    
    func setNavigationBarTitle(title: String, withLargeTitle: Bool) {
        navigationItem.title = title
        navigationController?.navigationBar.prefersLargeTitles = withLargeTitle
        navigationController?.navigationBar.tintColor = .blackColor
    }
    
    func shareImage(with imageView: UIImageView) {
        guard let image = imageView.image else {
            debugPrint("The image not found!")
            return
        }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.airDrop,
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.mail,
            .message ,
            .copyToPasteboard
        ]
        present(activityViewController, animated: true, completion: nil)
    }
}
