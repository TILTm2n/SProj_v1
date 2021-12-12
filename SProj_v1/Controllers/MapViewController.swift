//
//  MapViewController.swift
//  SProj_v1
//
//  Created by Eugene on 12.12.2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var restaurant: Restaurant!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

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
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {return nil}
        
        let annotationIdentifier = "restAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        
        //различие между MKPinAnnotationView и MKAnnotationView заключается в наличии будавки на карте!!!
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        //создание контейнера для картинки
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        //помещение картинки в контейнер
        rightImage.image = UIImage(named: restaurant.image)
        //добавление контейнера картинки на геопозицию
        annotationView?.rightCalloutAccessoryView = rightImage
        
        return annotationView
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
