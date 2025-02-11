//
//  ProfileDataSource.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation

final class ProfileDataSource {
    
    private let provider = Provider()
    
    func getUsers(completion: @escaping (Result<[UsersResponseModel], Error>) -> Void) {
        provider.request(.getUsers) { result in
            switch result {
            case .success(let response):
                do {
                    let users = try response.map([UsersResponseModel].self)
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getAlbums(userId: Int, completion: @escaping (Result<[AlbumsResponseModel], Error>) -> Void) {
        provider.request(.getAlbums(userId: userId)) { result in
            switch result {
            case .success(let response):
                do {
                    let users = try response.map([AlbumsResponseModel].self)
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
