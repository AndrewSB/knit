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
}


prefix operator ⭕ {}

prefix func ⭕ (named: Image.Face) -> UIImage {
    return UIImage(named: named.rawValue)!
}
