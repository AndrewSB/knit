//
//  ViewController.swift
//  octo-peer
//
//  Created by Andrew Breckenridge on 7/12/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {
    
    let name = "\(UIDevice.currentDevice().description) a.k.a. \(UIDevice.currentDevice().localizedModel)"
    
    lazy var queue(String) -> (Int) {
        return $0.characters.count
    }("d")

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    @IBAction func buttonWasHit(sender: UIButton) {
        print("\(self.name): \(sender.titleLabel!.text!)")
    }

}