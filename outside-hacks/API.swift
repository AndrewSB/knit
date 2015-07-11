//
//  API.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

class API {
    static let sharedInstance = API()
    
    private let baseUrl = "http://54.69.227.168:8080"
    
    enum Endpoint {
        case Base()
        case WithArg(Int)
    }
    
    private init() {
    }
}