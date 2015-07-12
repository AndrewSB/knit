//
//  SegueDefines.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import Foundation

enum Segue {
    
    enum To: String {
        case Message = "segueToMessages"
    }
    
    enum UnwindTo: String {
        case FriendList = "unwindSegueToFriendListViewController"
    }
}