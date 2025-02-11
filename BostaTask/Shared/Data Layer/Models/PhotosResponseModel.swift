//
//  PhotosResponseModel.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation

struct PhotosResponseModel: Codable {
    let albumID, id: Int?
    let title: String?
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
