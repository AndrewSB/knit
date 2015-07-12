//
//  MessageCoordinator.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

class MessageCoordinator: NSObject {
    class var sharedInstance : MessageCoordinator {
        struct Static {
            static let instance : MessageCoordinator = MessageCoordinator()
        }
        return Static.instance
    }
    
    var messages = [Message]()
    
    override init() {
        super.init()
        
        LocalMessage.observe(.NewMessageProcessed, classFunction: "newMessageSon:", inClass: self)
    }
    
    deinit {
        LocalMessage.resign(me: self)
    }
    
    func newMessageSon(notification: NSNotification) {
        let message = notification.userInfo!["message"]
        
        print(message)
        
        messages.append(message as! Message)
    }
}