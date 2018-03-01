//
//  ServiceError.swift
//  hello-ios
//
//  Created by TenTen on 2/28/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import Foundation

enum ServiceError : Error {
    case generic(Data)
}

extension ServiceError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .generic(let data):
            let error = try? JSONDecoder().decode(GenericErrorResp.self, from: data)
            return error?.errors?.first?["message"] ?? "Error can't parsed"
        default:
            return "dufuck"
        }
    }
}
