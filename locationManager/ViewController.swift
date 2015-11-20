
//

//  ViewController.swift

//  locationManager

//

//  Created by Sanjay Noronha on 2015/10/17.

//  Copyright © 2015 funza Academy. All rights reserved.

//



import UIKit

import MapKit





class ViewController: UIViewController,CLLocationManagerDelegate{
    
    
    
    @IBOutlet var myMapView: MKMapView!
    
    
    
    let myLocMgr = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        myLocMgr.desiredAccuracy = kCLLocationAccuracyBest
        
        myLocMgr.requestWhenInUseAuthorization()
        
        myLocMgr.startUpdatingLocation()
        
        myLocMgr.delegate = self
        
        
        
        
        
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // get most recent coordinate
        
        let myCoor = locations[locations.count - 1]
        
        print("LOCATION 0")
        print(locations[0])
        print("LOCATION REC")
        print(locations[locations.count - 1])
        
        
        
        // get lat and longit
        
        let myLat = myCoor.coordinate.latitude
        
        let myLong = myCoor.coordinate.longitude
        
        let myCoor2D = CLLocationCoordinate2D(latitude: myLat, longitude: myLong)
        
        
        
        // set span
        
        let myLatDelta = 0.05
        
        let myLongDelta = 0.05
        
        let mySpan = MKCoordinateSpan(latitudeDelta: myLatDelta, longitudeDelta: myLongDelta)
        
        
        
        let myRegion = MKCoordinateRegion(center: myCoor2D, span: mySpan)
        
        
        
        // center map at this region
        
        myMapView.setRegion(myRegion, animated: true)
        
        
        
        // add annotation
        
        let myAnno = MKPointAnnotation()
        
        myAnno.coordinate  = myCoor2D
        
        myMapView.addAnnotation(myAnno)
        
        
        
        
        
        // test and see how things look
        
        
        
    }
    
    
    
    
    
}

