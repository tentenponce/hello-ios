//
//  AppAssembler.swift
//  hello-ios
//
//  Created by TenTen on 2/28/18.
//  Copyright © 2018 TenTen. All rights reserved.
//
import Swinject

class AppAssembler {
    public static let instance = AppAssembler()
    
    private init() {
        let container = Container()
    }
}
