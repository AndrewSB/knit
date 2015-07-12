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
        case Raphie = "face-raphie"
        case Andrew = "face-andrew"
    }
}


prefix operator ⭕ {}

prefix func ⭕ (named: Image.Face) -> UIImage {
    return UIImage(named: named.rawValue)!
}
