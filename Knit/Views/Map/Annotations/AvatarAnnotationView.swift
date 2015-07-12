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
    var user: User!
    
    convenience init(user: User) {
        self.init(annotation: nil, reuseIdentifier: nil)
        self.user = user
        
        let firstName = String(split(user.name.characters) { $0 == " " }.first!).lowercaseString
        self.image = Toucan.Resize.resizeImage(UIImage(named: firstName)!, size: CGSize(width: 40, height: 40), fitMode:Toucan.Resize.FitMode.Scale)
        
        self.layer.borderColor = UIColor.yellowColor().CGColor
        self.layer.borderWidth = 4
        
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
}
