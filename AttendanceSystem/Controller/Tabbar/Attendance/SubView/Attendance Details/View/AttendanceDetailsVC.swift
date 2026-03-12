//
//  AttendanceDetailsVC.swift
//  AttendanceSystem
//
//  Created by Ankit on 17/02/26.
//

import UIKit
import GoogleMaps

class AttendanceDetailsVC: UIViewController {
    
    @IBOutlet weak var viewMap: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var lblBreakIn: UILabel!
    @IBOutlet weak var lblBreakout: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var lblTotalHours: UILabel!
    @IBOutlet weak var lblHoursWorked: UILabel!
    @IBOutlet weak var lblBreak: UILabel!
    @IBOutlet weak var lblExtraHours: UILabel!

    private var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupMap()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setupMap() {
        let camera = GMSCameraPosition.camera(
            withLatitude: 21.1702,   // Example: Surat
            longitude: 72.8311,
            zoom: 15
        )
        
        mapView = GMSMapView(frame: viewMap.bounds, camera: camera)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.isMyLocationEnabled = true
        
        viewMap.addSubview(mapView)
        
        // Optional marker
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 21.1702, longitude: 72.8311)
//        marker.title = "Attendance Location"
//        marker.snippet = "Checked in here"
//        marker.map = mapView
    }

}
