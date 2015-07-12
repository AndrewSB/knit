//
//  Friend.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import CoreLocation


/* 
    For local bluetooth things
*/
struct Friend {
    let name: String
    let battery: Double
    let seat: String
    
    init?(json: [String: String]) {
        guard let name = json["name"], battery = json["battery"], seat = json["seat"]
            else { return nil }
        
        self.name = name
        self.battery = battery.toDouble()!
        self.seat = seat
    }
}