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
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        LocalMessage.observe(.KnitHeaderWasTapped, classFunction: "openIfNotOpen", inClass: self)
        self.backgroundView.backgroundColor = UIColor(hex: "81C784")//Color.Global.Green.Light.rawValue)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        LocalMessage.resign(me: self)
    }
    
}

extension MasterViewController {
    
    func openIfNotOpen() {
        dispatch_async(dispatch_get_main_queue(), {
            self.setOpen(!self.open, animated: true)
        })
    }
    
}