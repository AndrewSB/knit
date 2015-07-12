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
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellID", forIndexPath: indexPath)
        cell.textLabel?.text = "lol"
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case data.count:
            return 50
        default:
            return 100
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let colors = Color.Stage.color(forStageName: data[section].0.stage) {
            let headerView = FriendListSectionHeaderView.instanceFromNib()
            
            headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 122)
            headerView.configure((data[section].0.stage, colors.light), song: (data[section].0.song, colors.dark))
            
            return headerView
        } else {
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
}