//
//  FriendListSectionHeaderView.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class FriendListSectionHeaderView: UIView {
    
    @IBOutlet weak var stageLabel: InsetLabel!
    @IBOutlet weak var songLabel: InsetLabel!
    @IBOutlet weak var messageButton: UIButton!
    
    class func instanceFromNib() -> FriendListSectionHeaderView {
        return UINib(nibName: "FriendListSectionHeaderView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! FriendListSectionHeaderView
    }
    
    func configure(stage: (name: String, hex: String), song: (name: String, hex: String)) {
        stageLabel.text = stage.name.uppercaseString
        stageLabel.backgroundColor = UIColor(hex: stage.hex)
        
        songLabel.leftInset = 44
        
        songLabel.text = song.name
        songLabel.backgroundColor = UIColor(hex: song.hex)
        
        messageButton.backgroundColor = UIColor(hex: stage.hex)
        messageButton.layer.cornerRadius = messageButton.frame.width / 2
        messageButton.layer.borderWidth = 4
        messageButton.layer.borderColor = UIColor.whiteColor().CGColor
        

    }

    @IBAction func messageButtonWasHit() {
    }
}
