//
//  FriendListViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class FriendListViewController: UITableViewController {
    
    var data = [(Header, [Friend])]()
    
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
                    let friend = (uB as! [[String: String]]).map({ return Friend(json: $0)! })
                    
                    self.data.append((header, friend))
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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
}