//
//  APINetwork.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation
import Moya

enum APINetwork {
    case getUsers
    case getAlbums(userId: Int)
    case getPhotos(albumId: Int)
}

extension APINetwork: TargetType {
    var baseURL: URL {
        URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getAlbums:
            return "/albums"
        case .getPhotos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getUsers:
            return .requestPlain
        case .getAlbums(let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.default)
        case .getPhotos(let albumId):
            return .requestParameters(parameters: ["albumId": albumId], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
