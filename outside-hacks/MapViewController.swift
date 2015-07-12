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
    
    let location = Location.sharedInstance
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        let userRegion = MKCoordinateRegion(center: Location.sharedInstance.mostRecentLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.setRegion(userRegion, animated: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView.addAnnotation(AvatarAnnotation(face: Image.Face.Andrew, at: Location.sharedInstance.mostRecentLocation!.coordinate))
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if let annotation = annotation as? AvatarAnnotation {
            return AvatarAnnotationView(face: annotation.face)
        }
        return MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
    }
    
}