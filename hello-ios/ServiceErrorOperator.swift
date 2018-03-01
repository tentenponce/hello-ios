//
//  ServiceErrorOperator.swift
//  hello-ios
//
//  Created by TenTen on 2/28/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import RxSwift
import Moya

extension ObservableType where E == Response {
    
    public func mapErrors() -> Observable<E> {
        return self.filterSuccessfulStatusCodes()
            .catchError { e in
                guard let error = e as? MoyaError else {
                    print("not a moya error")
                    throw e
                }
                
                guard case .statusCode(let response) = error else {
                    print("dont have status code")
                    throw e
                }
                
                if response.statusCode == 400 {
                    throw ServiceError.generic(response.data)
                } else {
                    throw e
                }
            }
    }
}
