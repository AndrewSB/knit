//
//  PopupContentView.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class PopupContentView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var batteryImageView: UIImageView!
    @IBOutlet weak var batteryLabel: UILabel!
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    class func instanceFromNib() -> PopupContentView {
        return UINib(nibName: "PopupContentView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! PopupContentView
    }
    
    func configure(user: User) {
        self.configure(user.name, battery: user.battery, location: user.seat)
    }
    
    func configure(name: String, battery: Double, location: String) {
        nameLabel.text = name
        
        let imageName: Int
        switch battery {
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
        batteryLabel.text = "\(imageName)%"
        
        locationLabel.text = location
    }

}
