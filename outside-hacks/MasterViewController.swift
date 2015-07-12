//
//  MasterViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class MasterViewController: MBPullDownController {

    override func viewDidLoad() {
        super.viewDidLoad()

        frontController = UIStoryboard.idIn("Friends", inStoryboard: "Main")
        backController = UIStoryboard.idIn("Map", inStoryboard: "Main")
        
        openBottomOffset = 88
        closedTopOffset = 0
        openDragOffsetPercentage = 0
        closeDragOffsetPercentage = 0
        
        (backgroundView as! MBPullDownControllerBackgroundView).dropShadowVisible = false
    }

}
