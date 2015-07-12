//
//  ColorDefines.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

class Color {
    enum Global {
        enum Green: String {
            case Light = "81C784"
            case Dark = "4CAF50"
        }
    }
    
    enum Stage {
        enum LandsEnd: String {
            case Light = "E84C80"
            case Dark = "5D1E33"
        }
        enum Sutro: String {
            case Light = "CC7CDA"
            case Dark = "523258"
        }
        enum TwinPeaks: String {
            case Light = "62B2F1"
            case Dark = "274761"
        }
        enum Panhandle: String {
            case Light = "FFB04D"
            case Dark = "67471F"
        }
        enum Elsewhere: String {
            case Light = "A4A4A4"
        }
    }
}