//
//  GroupMessageViewController.swift
//  Knit
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class GroupMessageViewController: JSQMessagesViewController {
    
    var messages: [Message] = [
        Message(text: "Hey man, where you at?", sender: (id: "BH", dispayName: "BH")),
        Message(text: "yo yo, I'm at Land's end! Come find me!", sender: (id: "AB", dispayName: "AB"))
    ]
    
    let outgoingBubbleImageView = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.whiteColor())
    let incomingBubbleImageView = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(hex: "#62B2F1"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
    }
}
/*
Useful message APIs
*/
extension GroupMessageViewController {
    func processNewMessage(message: Message) {
        messages.append(message)
        
        if message.senderId() == self.senderId {
            JSQSystemSoundPlayer.sharedPlayer().playSoundWithFilename("tap-warm", fileExtension: "aif", completion: nil)
            self.finishSendingMessage()
            Scanner.sharedInstance.processNewMessageForSending(message)
        } else {
            JSQSystemSoundPlayer.sharedPlayer().playSoundWithFilename("tap-metallic", fileExtension: "aif", completion: nil)
            self.finishReceivingMessage()
        }
    }
    
}

/*
Fucking stupid message APIs
*/
extension GroupMessageViewController {
    func setup() {
        self.senderId = UserDefaults.userID ?? "me"
        self.senderDisplayName = UserDefaults.userDisplayName ?? "Andrew"
        
        self.inputToolbar?.contentView?.leftBarButtonItem = nil
        
        
        let beautifulSendButton = UIButton(type: .Custom)
        beautifulSendButton.setImage(⭕Image.Icon.SendButton, forState: .Normal)
        
        self.inputToolbar!.contentView!.rightBarButtonItem = beautifulSendButton
        
        self.collectionView!.collectionViewLayout.springinessEnabled = false
        self.collectionView!.collectionViewLayout.messageBubbleFont = UIFont(name: "ProximaNova-Regular", size: 17)
        
        brand()
    }
    private func brand() {
        collectionView!.backgroundColor = UIColor(hex: Color.Global.Green.Light.rawValue)
        inputToolbar!.contentView!.backgroundColor = UIColor(hex: Color.Global.Green.Dark.rawValue)
        
        inputToolbar!.contentView!.textView!.backgroundColor = UIColor(hex: Color.Global.Green.SuperDark.rawValue)
        inputToolbar!.contentView!.textView!.textColor = UIColor.whiteColor()
        inputToolbar!.contentView!.textView!.placeHolderTextColor = UIColor.lightTextColor()
        inputToolbar!.contentView!.textView!.font = UIFont(name: "ProximaNova-Regular", size: 15)
        inputToolbar!.contentView!.textView!.layer.borderWidth = 0
        inputToolbar!.contentView!.textView!.contentInset.top += 2
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        
        processNewMessage(Message(text: text, sender: (id: senderId, dispayName: senderDisplayName)))
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        if messages[indexPath.row].senderId() == senderId {
            cell.textView!.textColor = UIColor(hex: Color.Global.Green.Dark.rawValue)
        } else {
            cell.textView!.textColor = UIColor.whiteColor()
        }
        
        return cell
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.row]
        
        return message.senderId() == senderId ? outgoingBubbleImageView : incomingBubbleImageView
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        
        let message = messages[indexPath.item]
        
        // Sent by me, skip
        if message.senderId() == senderId {
            return CGFloat(0.0);
        }
        
        // Same as previous sender, skip
        if indexPath.item > 0 {
            let previousMessage = messages[indexPath.item - 1]
            if previousMessage.senderId() == message.senderId() {
                return CGFloat(0.0);
            }
        }
        
        return kJSQMessagesCollectionViewCellLabelHeightDefault
    }
    
}

extension GroupMessageViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}