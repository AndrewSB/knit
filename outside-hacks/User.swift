//
//  User.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import CoreLocation

/*
    For current user and server communication
*/

class User {
    let id: String?
    
    let name: String
    let pictureUrl: String?
    
    let currentLocation: CLLocation?
    
    let battery: Double
    let seat: String
    
    init?(json: [String: String]) {
        guard let name = json["name"], battery = json["battery"], seat = json["seat"]
            else {
                self.id = nil
                self.name = ""
                self.pictureUrl = nil
                self.currentLocation = nil
                self.battery = 0
                self.seat = ""
                
                return nil
        }
        
        self.id = json["id"]
        
        self.name = name
        self.pictureUrl = json["pictureUrl"]
        
        if let loc = json["loc"] {
            let locs = split(loc.characters){ $0 == "," }.map({ String($0).toDouble()! })
            self.currentLocation = CLLocation(loc: (locs[0], locs[1]))
        } else {
            self.currentLocation = nil
        }
        
        self.battery = battery.toDouble()!
        self.seat = seat
    }
}