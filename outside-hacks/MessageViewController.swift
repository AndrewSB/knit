//
//  MessageViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class MessageViewController: JSQMessagesViewController {
    
    var otherUser: User!
    
    var messages = [Message]()
    
    let outgoingBubbleImageView = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.whiteColor())
    let incomingBubbleImageView = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(hex: "#62B2F1"))

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        
//        let panDownDismissRecognizer = 
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
    }
}
/*
    Useful message APIs
*/
extension MessageViewController {
    func processNewMessage(message: Message) {
        messages.append(message)
        
        if message.senderId() == self.senderId {
            JSQSystemSoundPlayer.jsq_playMessageSentSound()
            self.finishSendingMessage()
        } else {
            JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
            self.finishReceivingMessage()
        }
    }
}

/*
    Fucking stupid message APIs
*/
extension MessageViewController {
    func setup() {
        self.senderId = UserDefaults.userID ?? "me"
        self.senderDisplayName = UserDefaults.userDisplayName ?? "Andrew"
        
        self.inputToolbar?.contentView?.leftBarButtonItem = nil
        
        let beautifulSendButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 22))
        beautifulSendButton.imageView!.image = ⭕Image.Icon.SendButton
        
        self.inputToolbar?.contentView?.rightBarButtonItem = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 6))
        
        self.collectionView!.collectionViewLayout.incomingAvatarViewSize = .zeroSize
        self.collectionView!.collectionViewLayout.outgoingAvatarViewSize = .zeroSize
        
        self.collectionView!.collectionViewLayout.springinessEnabled = false
    }
    
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        
        processNewMessage(Message(text: text, sender: (id: senderId, dispayName: senderDisplayName)))
    }
    
    override func didPressAccessoryButton(sender: UIButton!) {
        
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
            cell.textView!.textColor = UIColor(hex: Color.Global.Green.Light.rawValue)
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