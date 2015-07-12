//
//  ImageDefines.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

enum Image {
    enum Face: String {
        case Alex = "alex"
        case Ben = "ben"
        case Case = "case"
        case Condon = "condon"
        case Benjamin = "me"
        case Raphie = "raphie"
        case Rohith = "rohith"
        case Stefan = "stefan"
        case Vikram = "vikram"
        case Zach = "zach"
    }
    
    enum Icon: String {
        case SendButton = "send-button"
        
        case Chat = "chat"
        case LocationPin = "location"
        case MusicPin = "music"
    }
}


prefix operator ⭕ {}

prefix func ⭕ (named: Image.Face) -> UIImage {
    return UIImage(named: named.rawValue)!
}

prefix func ⭕ (named: Image.Icon) -> UIImage {
    return UIImage(named: named.rawValue)!
}
