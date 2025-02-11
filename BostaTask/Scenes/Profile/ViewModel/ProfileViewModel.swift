//
//  ProfileViewModel.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation

final class ProfileViewModel {
    
    @Published var userData: UsersResponseModel?
    @Published var albums = [AlbumsResponseModel]()
    
    private let profileDS = ProfileDataSource()
    
    func getUsersRequest() {
        ShowAlert.loadingIndicator()
        profileDS.getUsers { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                guard let firstUserData = data.first,
                      let userId = firstUserData.id else {
                    ShowAlert.loadingIndicatorIsFailed(withErrorMessage: "Something went wrong")
                    return
                }
                userData = firstUserData
                getAlbumsRequest(userId: userId)
            case .failure(let error):
                ShowAlert.loadingIndicatorIsFailed(withErrorMessage: error.localizedDescription)
            }
        }
    }
    
    func getAlbumsRequest(userId: Int) {
        profileDS.getAlbums(userId: userId) { [weak self] result in
            guard let self else { return }
            ShowAlert.dismissLoadingIndicator()
            
            switch result {
            case .success(let data):
                albums = data  
            case .failure(let error):
                ShowAlert.loadingIndicatorIsFailed(withErrorMessage: error.localizedDescription)
            }
        }
    }
}
