//
//  AvatarAnnotation.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import MapKit

class AvatarAnnotation: NSObject, MKAnnotation {
    var user: User
    var coordinate: CLLocationCoordinate2D
    
    init(user: User, at: CLLocationCoordinate2D) {
        self.user = user
        self.coordinate = at
    }
}
