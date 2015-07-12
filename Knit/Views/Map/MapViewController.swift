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
    let d = MMPopLabel(text: "hi")
    
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
        
        mapView.addSubview(d)
        
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
        if let view = view as? AvatarAnnotationView {
//            var popoverView = MMPopLabel(frame: CGRect(origin: .zeroPoint, size: CGSize(width: self.mapView.frame.width * 0.9, height: 200)))
//            popoverView.set
            
//            text: "", options: MMPopLabelAnimationOptions.PopViewOnly
            
//            let popoverContent = PopupContentView.instanceFromNib()
//            print(view.user)
//            popoverContent.configure(view.user)
//            popoverContent.frame = popoverView.frame
//
//            popoverView.addSubview(popoverContent)
            
            
            d.popAtView(view)
//            mapView.addSubview(popoverView)
        }
    }
    
    func updateLocation() {
        mapView.showsUserLocation = true
    }
    
}