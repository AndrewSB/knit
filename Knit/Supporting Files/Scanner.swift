//
//  Scanner.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import MultipeerConnectivity

class Scanner: NSObject {
    let scanHelper: ScanHelper
    
    class var sharedInstance : Scanner {
        struct Static {
            static let instance : Scanner = Scanner()
        }
        return Static.instance
    }
    
    override init() {
        scanHelper = ScanHelper()
        super.init()
        LocalMessage.observe(.NewMessageReceived, classFunction: "newMessageRecieved:", inClass: self)
    }
    
    func newMessageRecieved() {
        print("fuck u no data")
    }
    
    func newMessageRecieved(notification : NSNotification) {
        print("new message recieved \(notification)")
        
        let peerID = notification.userInfo!["peerID"] as! MCPeerID
        let peerDisplayName = peerID.displayName
        let data = notification.userInfo!["data"] as! NSData
        let text = NSString(data: data, encoding: NSUTF8StringEncoding)!
        
        let message = Message(text: String(text), sender: (id: peerDisplayName, dispayName: peerDisplayName))
        print("got that message son \(message.text())")
        
        LocalMessage.post(.NewMessageProcessed, arg: ["message": message])
    }
    
    func processNewMessageForSending(message: Message) {
        scanHelper.sendMessage(message.text())
    }
    
    deinit {
        LocalMessage.resign(me: self)
    }
}