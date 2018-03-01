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
            "X-IBM-Client-Id": "e409ff0a-4695-4a13-b67f-bf5fdf6b2590",
            "X-IBM-Client-Secret": "U6aT1pP4dY5jA6tQ0pR7gF0aS3tK7rK8kD8aJ7yX4mN1yY7sU6"
        ]
    }
}
