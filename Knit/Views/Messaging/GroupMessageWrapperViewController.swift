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

        // Do any additional setup after loading the view.
    }

}
