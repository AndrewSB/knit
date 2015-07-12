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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        if let _ = Location.sharedInstance.mostRecentLocation {
            updateLocation()
            let userRegion = MKCoordinateRegion(center: Location.sharedInstance.mostRecentLocation!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            mapView.setRegion(userRegion, animated: true)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let curLocation = Location.sharedInstance.mostRecentLocation {
            mapView.addAnnotation(AvatarAnnotation(face: Image.Face.Raphie, at: curLocation.coordinate))
        }
        
        LocalMessage.observe(.NewLocationRegistered, classFunction: "updateLocation", inClass: self)
    }
    
    override func viewWillDisappear(animated: Bool) {
        LocalMessage.resign(me: self)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if let _ = annotation as? AvatarAnnotation {
            return AvatarAnnotationView(user: User(name: "Rohith Varanasi")!)
        } else {
            return MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        }
        
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        
    }
    
    func updateLocation() {
        mapView.showsUserLocation = true
    }
    
}

extension MapViewController: UIPopoverPresentationControllerDelegate {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popoverPopup" {
            let popoverViewController = segue.destinationViewController as! UIViewController
            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
            popoverViewController.popoverPresentationController!.delegate = self
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}