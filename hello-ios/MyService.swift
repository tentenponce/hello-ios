//
//  Service.swift
//  hello-ios
//
//  Created by TenTen on 2/27/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import Moya

enum Service {
    case login(param: LoginParam)
}

extension Service: TargetType {
    var baseURL: URL {
        return URL(string: "https://api-uat.unionbankph.com/ubp/uat/hr/benefits/v1/")!
    }
    
    var path: String {
        switch self {
        case .login:
                return "login"
        }
    }
    
    var method: Method {
        switch self {
        case .login:
            return .post
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .login(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-type": "application/json",
            "X-IBM-Client-Id": "",
            "X-IBM-Client-Secret": ""
        ]
    }
}
