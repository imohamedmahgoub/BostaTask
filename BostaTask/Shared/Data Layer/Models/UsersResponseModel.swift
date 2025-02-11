//
//  UsersResponseModel.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import Foundation

struct UsersResponseModel: Codable {
    let id: Int?
    let name, username, email: String?
    let address: AddressResponseModel?
    let phone, website: String?
    let company: CompanyResponseModel?
}

struct AddressResponseModel: Codable {
    let street, suite, city, zipcode: String?
    let geo: GeoResponseModel?
}

struct GeoResponseModel: Codable {
    let lat, lng: String?
}

struct CompanyResponseModel: Codable {
    let name, catchPhrase, bs: String?
}
