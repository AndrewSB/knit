//
//  FriendListViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {
    
    var data = [(Header, [User])]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.backgroundView = nil
        self.tableView.backgroundColor = UIColor.redColor()
    }
    
    private func reloadData() {
        
        let userJSON = NSBundle.json("users")!.json()!
        let headerJSON = NSBundle.json("headers")!.json()!
    
        for header in headerJSON {
            for userBlock in userJSON {
                if let uB = userBlock[header["stage"] as! String] {
                    let header = Header(json: header as! [String: String])!
                    let user = (uB as! [[String: String]]).map({ return User(json: $0)! })
                    
                    self.data.append((header, user))
                }
            }
        }
    }
}

extension FriendListViewController {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath) as! FriendTableViewCell
        
        let friend = data[indexPath.section].1[indexPath.row]
        
        
//        cell.avatarImageView.image = UIImage(named: friend.name)
        cell.nameLabel.text = friend.name
        
        let imageName: Int
        switch friend.battery {
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
        cell.batteryImageView.image = UIImage(named: "\(imageName)")
        cell.batteryLabel.text = "\(round(friend.battery))%"
        
        
        cell.locationLabel.text = friend.seat
        
        let hex = Color.Stage.color(forStageName: data[indexPath.section].0.stage)!.light
        cell.activeColor = UIColor(hex: hex)
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case data.count - 1:
            return 44
        default:
            return 88
        }
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zeroRect)
    }
        
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let colors = Color.Stage.color(forStageName: data[section].0.stage) {
            let headerView = FriendListSectionHeaderView.instanceFromNib()
            
            headerView.configure((data[section].0.stage, colors.light), song: (data[section].0.song, colors.dark))
            
            if section == data.count - 1 {
                (headerView.stageLabel.superview!.constraints.last! as NSLayoutConstraint).active = false
                
                let fullSizeContraint = NSLayoutConstraint(item: headerView, attribute: .Height, relatedBy: .Equal, toItem: headerView.stageLabel, attribute: .Height, multiplier: 1, constant: 0)
                headerView.addConstraint(fullSizeContraint)
            }
            
            return headerView
        } else {
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
}