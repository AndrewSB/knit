//
//  Message.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class Message: NSObject, JSQMessageData {

    var _text: String!
    var _senderId: String
    var _senderDisplayName: String
    var _date: NSDate
    var _imageUrl: String?
    
    convenience init(text: String?, sender: (id: String, dispayName: String)) {
        self.init(text: text, senderId: sender.id, senderDisplayName: sender.dispayName, imageUrl: nil)
    }
    
    init(text: String?, senderId: String, senderDisplayName: String, imageUrl: String?) {
        self._text = text!
        self._senderId = senderId
        self._senderDisplayName = senderDisplayName
        self._date = NSDate()
        self._imageUrl = imageUrl
        
    }
    
    convenience init?(json: [String: String]) {
        guard let text = json["text"], userID = json["id"] else {
            return nil
        }
        
        self.init(text: text, sender: (id: userID, dispayName: userID))
    }
    
    func senderId() -> String! { return _senderId }
    func senderDisplayName() -> String! { return _senderDisplayName }
    func date() -> NSDate! { return _date }
    func isMediaMessage() -> Bool { return _imageUrl != nil }
    func messageHash() -> UInt {
        return UInt(abs(_text?.hash ?? 0) ^ abs(_date.hash ?? 0))
    }
    func text() -> String! { return self._text }
    
}
