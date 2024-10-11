//
//  User.swift
//  moya-integration
//
//  Created by Creatives Solutions on 11/10/2024.
//


import Foundation

struct User: Codable {
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
