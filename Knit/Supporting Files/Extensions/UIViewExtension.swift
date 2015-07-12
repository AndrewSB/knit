//
//  UIViewExtension.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

extension UIView {
    
    class func fromXib(named xibName: String) -> UIView {
        return NSBundle.mainBundle().loadNibNamed(xibName, owner: nil, options: nil).first! as! UIView
    }
    
    convenience init(backgroundColor: UIColor) {
        self.init()
        self.backgroundColor = backgroundColor
    }

}