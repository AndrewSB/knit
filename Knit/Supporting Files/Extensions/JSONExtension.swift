//
//  NSBundleExtension.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

extension NSBundle {
    class func json(named: String) -> NSData? {
        guard let path = NSBundle.mainBundle().pathForResource(named, ofType: "json"), data = NSData(contentsOfFile: path)
            else { return nil }
        
        return data

    }
}

extension NSData {
    func json() -> [[String: AnyObject]]? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(self, options: []) as? [[String: AnyObject]]
        } catch {
            return nil
        }
    }
    
    func simpleJSON() -> [String: String]? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(self, options: []) as? [String: String]
        } catch {
            return nil
        }
    }
}