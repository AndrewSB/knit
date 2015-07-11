//
//  User.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import CoreLocation

struct User {
    let id: String
    let name: String
    let pictureUrl: String
    let currentLocation: CLLocation
    
    init?(json: [String: String]) {
        guard let id = json["id"], name = json["name"], pictureUrl = json["pictureUrl"], loc = json["loc"]
            else { return nil }
        
        self.id = id
        self.name = name
        self.pictureUrl = pictureUrl
        
        let locs = split(loc.characters){ $0 == "," }.map({ String($0).toDouble()! })
        self.currentLocation = CLLocation(loc: (locs[0], locs[1]))
    }
    
//    init (id: String, name: String, pictureUrl: String) {
//        self.id = id
//        self.name = name
//        self.pictureUrl = pictureUrl
//    }
}