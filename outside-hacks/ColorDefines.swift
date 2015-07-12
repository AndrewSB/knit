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
            case Dark = "54AD58"
        }
    }
    
    enum Stage {
        enum LandsEnd: String {
            case Light = "D9638D"
            case Dark = "5D1E33"
            
            static func colors() -> (String, String) {
                return (Stage.LandsEnd.Light.rawValue, Color.Stage.LandsEnd.Dark.rawValue)
            }
        }
        enum Sutro: String {
            case Light = "CC80DA"
            case Dark = "523258"
            
            static func colors() -> (String, String) {
                return (Stage.Sutro.Light.rawValue, Color.Stage.Sutro.Dark.rawValue)
            }
        }
        enum TwinPeaks: String {
            case Light = "6CB5EF"
            case Dark = "274761"
            
            static func colors() -> (String, String) {
                return (Stage.TwinPeaks.Light.rawValue, Color.Stage.TwinPeaks.Dark.rawValue)
            }
        }
        enum Panhandle: String {
            case Light = "FBB35D"
            case Dark = "67471F"
            
            static func colors() -> (String, String) {
                return (Stage.Panhandle.Light.rawValue, Color.Stage.Panhandle.Dark.rawValue)
            }
        }
        enum Elsewhere: String {
            case Light = "A4A4A4"
            
            static func colors() -> (String, String) {
                return (Stage.Elsewhere.Light.rawValue, Stage.Elsewhere.Light.rawValue)
            }
        }
        
        static func color(forStageName stageName: String) -> (light: String, dark: String)? {
            switch stageName {
            case "Lands End":
                return Color.Stage.LandsEnd.colors()
            case "Sutro":
                return Color.Stage.Sutro.colors()
            case "Twin Peaks":
                return Color.Stage.TwinPeaks.colors()
            case "Panhandle":
                return Color.Stage.Panhandle.colors()
            case "Elsewhere":
                return Color.Stage.Elsewhere.colors()
            default:
                return nil
            }
        }
    }
}