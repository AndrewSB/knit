//
//  FriendTableViewCell.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var batteryImageView: UIImageView!
    @IBOutlet weak var batteryLabel: UILabel!
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var onePxBottomView: UIView!
    
    
    var activeColor: UIColor! {
        didSet {
            avatarImageView.layer.borderColor = activeColor.CGColor
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.layer.borderWidth = 4
        
        self.selectedBackgroundView = UIView(backgroundColor: UIColor(hex: Color.Global.Green.Dark.rawValue))
    }
}
