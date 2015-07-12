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
    
    func senderId() -> String! { return _senderId }
    func senderDisplayName() -> String! { return _senderDisplayName }
    func date() -> NSDate! { return _date }
    func isMediaMessage() -> Bool { return _imageUrl != nil }
    func messageHash() -> UInt {
        let contentHash = self.isMediaMessage() ? _imageUrl!.hash : _text!.hash
        let combinedHash = _senderId.hash ^ _date.hash //^ contentHash
        let normalized = Int(combinedHash.distanceTo(0)).distanceTo(0)
        return UInt(normalized)
    }
    func text() -> String! { return self._text }
    
}
