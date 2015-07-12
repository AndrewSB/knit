//
//  Scanner.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class Scanner {
    let scanHelper: ScanHelper
    
    class var sharedInstance : Scanner {
        struct Static {
            static let instance : Scanner = Scanner()
        }
        return Static.instance
    }
    
    init() {
        scanHelper = ScanHelper()
        
        LocalMessage.observe(.NewMessageReceived, classFunction: "newMessage", inClass: self)
    }
    
    func newMessage(sender: AnyObject) {
        print("new message recieved \(sender)")
        
        let peerID = sender["peerID"] as! MCPeerID
        let peerDisplayName = peerID.displayName
        let data = sender["data"] as! NSData
        let text = NSString(data: data, encoding: NSUTF8StringEncoding)!
        
        let message = Message(text: String(text), sender: (id: peerDisplayName, dispayName: peerDisplayName))
        print("got that message son \(message)")
        
        LocalMessage.post(.NewMessageProcessed, arg: ["message": message])
    }
    
    deinit {
        LocalMessage.resign(me: self)
    }
}