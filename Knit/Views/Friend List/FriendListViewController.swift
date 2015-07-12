//
//  FriendListViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {
    @IBOutlet weak var tableHeaderView: UIView!
    
    lazy var data: [(Header, [User])] = {
        var data = [(Header, [User])]()
        
        let userJSON = NSBundle.json("users")!.json()!
        let headerJSON = NSBundle.json("headers")!.json()!
        
        
        /* 
            Translate to functional ASAP
        */
//        headerJSON.map({ header in
//            let relevantUserJSON = userJSON.filter({ users in
//                users[header["stage"] as! String] as? String
//            }).first
//            
//            return (header, User(json: relevantUserJSON))
//        })
        
        for header in headerJSON {
            for userBlock in userJSON {
                if let uB = userBlock[header["stage"] as! String] {
                    let header = Header(json: header as! [String: String])!
                    let user = (uB as! [[String: String]]).map({ return User(json: $0)! })
                    
                    data.append((header, user))
                }
            }
        }
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.sectionFooterHeight = 0
        
        self.tableView.tableFooterView = UIView(frame: .zeroRect)
        self.tableView.contentInset.bottom = -20
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableHeaderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("didTap")))
    }
    
    func didTap() {
        LocalMessage.post(.KnitHeaderWasTapped)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
        if let des = segue.destinationViewController as? MessageViewController {
            des.otherUser = sender as! User
        }
    }
    
    @IBAction func unwindToFriendList(sender: UIStoryboardSegue){}
}

extension FriendListViewController {
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath) as! FriendTableViewCell
        
        let friend = data[indexPath.section].1[indexPath.row]
        let firstName = String(split(friend.name.characters) { $0 == " " }.first!).lowercaseString
        
        cell.avatarImageView.image = UIImage(named: firstName)
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
        
        
        cell.onePxBottomView.hidden = indexPath.row == data[indexPath.section].1.count - 1
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        performSegueWithIdentifier(Segue.To.Message.rawValue, sender: data[indexPath.section].1[indexPath.row] as AnyObject)
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
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let colors = Color.Stage.color(forStageName: data[section].0.stage) {
            let headerView = FriendListSectionHeaderView.instanceFromNib()
            
            headerView.configure((data[section].0.stage, colors.light), song: (data[section].0.song, colors.dark))
            
            if section == data.count - 1 {
                headerView.labelEqualHeightsConstraint.active = false
                headerView.stageToBottomConstraint.constant = 0
                headerView.updateConstraintsIfNeeded()
               
                headerView.addConstraint(NSLayoutConstraint(item: headerView, attribute: .Height, relatedBy: .Equal, toItem: headerView.stageLabel, attribute: .Height, multiplier: 1, constant: 0))
                
                headerView.messageButton.hidden = true
                headerView.musicPinImageView.hidden = true
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