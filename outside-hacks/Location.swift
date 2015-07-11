//
//  Location.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import CoreLocation

class Location: CLLocationManager, CLLocationManagerDelegate {
    static let singleton = Location()
    
    var mostRecentLocation: CLLocation? {
        didSet {
            UserDefaults.lastLocation = mostRecentLocation
            LocalMessage.post(.NewLocationRegistered)
        }
    }
    
    private override init() {
        super.init()
        self.delegate = self
        self.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        mostRecentLocation = UserDefaults.lastLocation
        
        switch CLLocationManager.authorizationStatus() {
        case .AuthorizedWhenInUse, .AuthorizedAlways:
            self.startUpdatingLocation()
        case .Denied, .NotDetermined, .Restricted:
            self.requestWhenInUseAuthorization()
            print("you can't see me")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.mostRecentLocation = locations.last as? CLLocation
    }
}