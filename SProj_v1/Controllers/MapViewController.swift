//
//  MapViewController.swift
//  SProj_v1
//
//  Created by Eugene on 12.12.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var restaurant: Restaurant!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let restaurant = restaurant else {return}
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location ) { placemarks, error in
            guard error == nil else {return}
            guard let placemarks = placemarks else {return}
            let placemark = placemarks.first!
            
            let annotation = MKPointAnnotation()
            annotation.title = self.restaurant.name
            annotation.subtitle = self.restaurant.type
            
            guard let location = placemark.location else {return}
            annotation.coordinate = location.coordinate
            
            self.mapView?.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
