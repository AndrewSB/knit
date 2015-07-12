//
//  InsetLabel.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class InsetLabel: UILabel {
    
    var leftInset: CGFloat?

    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 0, left: leftInset ?? 22, bottom: 0, right: 0)))
    }

}
