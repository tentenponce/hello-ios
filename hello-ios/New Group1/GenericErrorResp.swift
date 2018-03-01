//
//  GenericErrorResp.swift
//  hello-ios
//
//  Created by TenTen on 2/28/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

public struct GenericErrorResp: Codable {
    var errors: [Dictionary<String, String>]?
}
