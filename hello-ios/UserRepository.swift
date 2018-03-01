//
//  UserRepository.swift
//  hello-ios
//
//  Created by TenTen on 2/28/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import RxSwift
import Moya

public class UserRepository {
    
    private let service: MyService
    
    init(service: MyService) {
        self.service = service
    }
    
    public func login(param: LoginParam) -> Observable<LoginResp> {
        return self.service.rx
            .request(.login(param: param))
            .asObservable()
            .mapErrors()
            .map(LoginResp.self)
    }
}
