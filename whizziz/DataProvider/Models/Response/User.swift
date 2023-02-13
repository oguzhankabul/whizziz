//
//  User.swift
//  whizziz
//
//  Created by Oğuzhan Kabul on 13.02.2023.
//

import Foundation

// MARK: - User
struct User: Decodable {
    let result: Bool
    let data: DataClass
    enum CodingKeys: CodingKey {
        case result
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.result = try container.decode(Bool.self, forKey: .result)
        self.data = try container.decode(DataClass.self, forKey: .data)
    }
}

// MARK: - DataClass
struct DataClass: Decodable {
    let company: Company
    let user: DataUser
    let api: API
}

// MARK: - API
struct API: Decodable {
    let title: String
    let permission: Permission
}

// MARK: - Permission
struct Permission: Decodable {
    let sms: SMS
    let user: PermissionUser
}

// MARK: - SMS
struct SMS: Decodable {
    let title: String
    let sub: SMSSub
}

// MARK: - SMSSub
struct SMSSub: Decodable {
    let headers, send, report, group: String
    let recipient, blacklist, inbox, otp: String
}

// MARK: - PermissionUser
struct PermissionUser: Decodable {
    let title: String
    let sub: UserSub
}

// MARK: - UserSub
struct UserSub: Decodable {
    let payment, iys: String
}

// MARK: - Company
struct Company: Decodable {
    let name, surname: String
}

// MARK: - DataUser
struct DataUser: Decodable {
    let id: Int
    let username: String
}

