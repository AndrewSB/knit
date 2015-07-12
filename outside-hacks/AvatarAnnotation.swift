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
    var face: Image.Face
    var coordinate: CLLocationCoordinate2D
    
    init(face: Image.Face, at: CLLocationCoordinate2D) {
        self.face = face
        self.coordinate = at
    }
}
