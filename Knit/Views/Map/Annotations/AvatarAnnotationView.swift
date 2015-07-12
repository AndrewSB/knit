//
//  AvatarAnnotationView.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import MapKit
import Toucan

class AvatarAnnotationView: MKAnnotationView {
    convenience init(face: Image.Face) {
        self.init(annotation: nil, reuseIdentifier: nil)
        
        self.image = Toucan.Resize.resizeImage(⭕face, size: CGSize(width: 44, height: 44), fitMode:Toucan.Resize.FitMode.Scale)
        
        self.layer.borderColor = UIColor.yellowColor().CGColor
        self.layer.borderWidth = 4
        
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
}
