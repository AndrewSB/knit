//
//  MapViewController.swift
//  outside-hacks
//
//  Created by Andrew Breckenridge on 7/11/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var pullableView: PullableView!
    
    let friendListViewController = UIStoryboard.idIn("pullList", inStoryboard: "Main")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPullView()
    }
    
}

extension MapViewController: PullableViewDelegate {
    
    func setupPullView() {
        
        pullableView.backgroundColor = UIColor.redColor()
        pullableView.openedCenter = self.view.center
        pullableView.closedCenter = CGPoint(x: self.view.center.x, y: self.view.frame.size.height - 44)
        
        
        pullableView.handleView = UIView()
        
        pullableView.delegate = self
        
//        pullableView.addSubview(friendListViewController.view)
        
    }
    
    func pullableView(pView: PullableView!, didChangeState opened: Bool) {
        print("did change \(opened)")
    }
    
}