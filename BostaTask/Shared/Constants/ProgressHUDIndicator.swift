//
//  ProgressHUDIndicator.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation
import ProgressHUD

class ShowAlert {
        
    static func loadingIndicator(message: String = "", interaction: Bool = false) {
        ProgressHUD.show(message, interaction: interaction)
    }
    
    static func loadingIndicatorIsSuccessful(withMessage message: String, interaction: Bool = false) {
        ProgressHUD.showSucceed(message, interaction: interaction)
    }
    
    static func loadingIndicatorIsFailed(withErrorMessage message: String) {
        ProgressHUD.show(message, icon: .failed, interaction: false)
    }
    
    static func dismissLoadingIndicator() {
        ProgressHUD.dismiss()
    }
}
