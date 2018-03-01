//
//  BaseSubscriber.swift
//  hello-ios
//
//  Created by TenTen on 2/28/18.
//  Copyright © 2018 TenTen. All rights reserved.
//

import RxSwift
import Moya

func baseSubscriber<T>(onNext: @escaping (T) -> Void, onError: @escaping (Error) -> Void, onCompleted: @escaping () -> Void)  -> (RxSwift.Event<T>) -> Void {
    return { event in
        switch event {
        case let .next(element):
            print("super next")
            onNext(element)
            
        case .completed:
            print("super completed")
            onCompleted()
            
        case let .error(error):
            print("super error")
            if let serviceError = error as? ServiceError {
                print("Service error: \(serviceError.errorDescription ?? "Something wrong")")
            } else {
                onError(error)
            }
        }
    }
}

