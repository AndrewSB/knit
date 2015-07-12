//
//  NSNotificationCenterHelper.swift
//  The Mouve
//
//  Created by Andrew Breckenridge on 4/25/15.
//  Copyright (c) 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation
import UIKit

enum LocalMessageNotification: String {
    case NewLocationRegistered = "NewLocationRegistered"
    case KnitHeaderWasTapped = "KnitHeaderWasTapped"
    
    case NewMessageReceived = "receiveMessage"
    case NewMessageProcessed = "NewMessageProcessed"
}

class LocalMessage {
    class func post(message: LocalMessageNotification) {

        NSNotificationCenter.defaultCenter().postNotificationName(message.rawValue, object: self)
    }
    
    class func post(message: LocalMessageNotification, arg: [NSObject: AnyObject]) {
        
        NSNotificationCenter.defaultCenter().postNotificationName(message.rawValue, object: self, userInfo: arg)
    }
    
    class func observe(message: LocalMessageNotification, classFunction: String, inClass: AnyObject) {
        
        NSNotificationCenter.defaultCenter().addObserver(inClass, selector: Selector(classFunction), name: message.rawValue, object: nil)
    }
    
    class func resign(me classToResign: AnyObject) {
        NSNotificationCenter.defaultCenter().removeObserver(classToResign)
    }
}