//
//  User.swift
//  hello-ios
//
//  Created by TenTen on 2/27/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

struct User: Codable {
    var id: Int
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "userId"
        case name
    }
}
