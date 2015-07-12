//
//  MessageWrapperViewController.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class MessageWrapperViewController: UIViewController {
    
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
        
        assert(user.count == 1, "weird user array in the wrapper")
        let cur = user.first! as User
        
        print(cur.stage)
        print(Color.Stage.color(forStageName: cur.stage!))

        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 4
        avatarImageView.layer.borderColor = UIColor(hex: Color.Stage.color(forStageName: cur.stage!)!.light).CGColor
        
        nameLabel.text = cur.name
        
        
        let imageName: Int
        switch cur.battery {
        case 0...15:
            imageName = 10
        case 15...40:
            imageName = 20
        case 40...55:
            imageName = 50
        case 55...70:
            imageName = 60
        case 70...85:
            imageName = 80
        case 85...95:
            imageName = 90
        default:
            imageName = 100
        }
        batteryImageView.image = UIImage(named: "\(imageName)")
        batteryLabel.text = "\(Int(round(cur.battery)))%"
        
        locationLabel.text = cur.stage!
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let swipeDownDismissRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("didSwipe"))
        swipeDownDismissRecognizer.delegate = self
        swipeDownDismissRecognizer.direction = .Down
        
        self.headerView.addGestureRecognizer(swipeDownDismissRecognizer)
    }
    
    
    func didSwipe() {
        performSegueWithIdentifier(Segue.UnwindTo.FriendList.rawValue, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MessageWrapperViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}