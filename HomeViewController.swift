//
//  FavoriteViewController.swift
//  TabbarIrfan
//
//  Created by apple on 2/18/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class HomeViewController: UIViewController {
    func mapView()  {
         let camera = GMSCameraPosition.camera(withLatitude: 23.805292, longitude: 90.369785, zoom: 20.0)
         let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
         view = mapView
         let marker = GMSMarker()
         marker.position = CLLocationCoordinate2D(latitude: 23.805292, longitude: 90.369785)
         marker.map = mapView
         
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView()

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
