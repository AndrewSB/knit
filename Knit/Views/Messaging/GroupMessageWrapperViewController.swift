//
//  GroupMessageWrapperViewController.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class GroupMessageWrapperViewController: UIViewController {
    
    var user: [User]!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var batteryImageView: UIImageView!
    @IBOutlet weak var batteryLabel: UILabel!
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView.image = UIImage(named: "landsend")
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 4
        avatarImageView.layer.borderColor = UIColor(hex: Color.Stage.LandsEnd.Light.rawValue).CGColor
        
        nameLabel.text = "Land's End"
        
        batteryImageView.hidden = true
        batteryLabel.hidden = true
                
        locationLabel.text = "Lands End"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let swipeDownDismissRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("didSwipe"))
        swipeDownDismissRecognizer.delegate = self
        swipeDownDismissRecognizer.direction = .Down
        
        self.headerView.addGestureRecognizer(swipeDownDismissRecognizer)
    }
    
    
    func didSwipe() {
        JSQSystemSoundPlayer.sharedPlayer().playSoundWithFilename("SWISH", fileExtension: "mp3", completion: nil)
        performSegueWithIdentifier(Segue.UnwindTo.FriendList.rawValue, sender: nil)
    }

}

extension GroupMessageWrapperViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}