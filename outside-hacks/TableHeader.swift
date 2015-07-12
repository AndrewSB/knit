//
//  TableHeader.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

struct TableHeader {
    let stage: String
    let song: String
    
    init?(json: [String: String]) {
        guard let stage = json["stage"], song = json["song"] else { return nil }
        
        self.stage = stage
        self.song = song
    }
}