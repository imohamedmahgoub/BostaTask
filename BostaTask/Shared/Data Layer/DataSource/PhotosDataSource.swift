//
//  PhotosDataSource.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation

final class PhotosDataSource {
    
    func getPhotos(albumId: Int, completion: @escaping (Result<[PhotosResponseModel], Error>) -> Void) {
        Provider().request(.getPhotos(albumId: albumId)) { result in
            switch result {
            case .success(let response):
                do {
                    let users = try response.map([PhotosResponseModel].self)
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
