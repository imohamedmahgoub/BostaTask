//
//  AlbumDetailsViewModel.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation

final class AlbumDetailsViewModel {
    
    @Published var photos = [PhotosResponseModel]()
    
    private var allPhotos = [PhotosResponseModel]()
    private let photoDS = PhotosDataSource()
    
    func getPhotosRequest(albumId: Int) {
        ShowAlert.loadingIndicator()
        
        photoDS.getPhotos(albumId: albumId) { [weak self] result in
            guard let self else { return }
            ShowAlert.dismissLoadingIndicator()
            
            switch result {
            case .success(let data):
                photos = data
                allPhotos = data
            case .failure(let error):
                ShowAlert.loadingIndicatorIsFailed(withErrorMessage: error.localizedDescription)
            }
        }
    }
    
    func searchWithTitle(_ title: String) {
        title.isEmpty ?
        (photos = allPhotos) :
        (photos = allPhotos.filter { $0.title?.lowercased().contains(title.lowercased()) ?? false })
    }
}
