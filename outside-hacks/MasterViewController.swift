//
//  MasterViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class MasterViewController: MBPullDownController {
    
    let viewControllers = (
        map: UIStoryboard.idIn("Map", inStoryboard: "Main"),
        friends: UIStoryboard.idIn("Friends", inStoryboard: "Main")
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        frontController = viewControllers.friends
        backController = viewControllers.map
        
        openBottomOffset = 64
        closedTopOffset = 0
        openDragOffsetPercentage = 0
        closeDragOffsetPercentage = 0
        
        (backgroundView as! MBPullDownControllerBackgroundView).dropShadowVisible = false
//        setOpen(true, animated: false)
    }

}
