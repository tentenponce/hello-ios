//
//  Item.swift
//  hello-ios
//
//  Created by TenTen on 2/26/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

struct Item: Codable {
    var id: Int
    var name: String
    var user: User?
}
