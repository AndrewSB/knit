//
//  UIStoryboardExtension.swift
//  Jobstart
//
//  Created by Andrew Breckenridge on 7/9/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    class func initialFor(storyboardNamed: String) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardNamed, bundle: NSBundle.mainBundle())
        return storyboard.instantiateInitialViewController()!
    }
    
    class func idIn(viewControllerId: String, inStoryboard storyboardNamed: String) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardNamed, bundle: NSBundle.mainBundle())
        let viewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerId) as UIViewController
        return viewController
    }
    
}