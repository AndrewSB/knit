//
//  CLLocationExtension.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import CoreLocation

extension CLLocation {
    convenience init(loc: (Double, Double)) {
        self.init(latitude: CLLocationDegrees(loc.0), longitude: CLLocationDegrees(loc.1))
    }
}
