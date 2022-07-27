//
//  User.swift
//  AdvancedCodableInSwift
//
//  Created by Ramill Ibragimov on 27.07.2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let occupation: Occupation?
    let dateOfBirth: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case username
        case firstName
        case lastName
        case occupation
        case dateOfBirth
    }
}
