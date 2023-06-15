import Foundation
import MapKit

@MainActor
class GeolocationManager: NSObject, ObservableObject{
    @Published var location: CLLocation?
    @Published var region = MKCoordinateRegion()
    
    private let geoManager = CLLocationManager()
    
    override init(){
        super.init()
        geoManager.desiredAccuracy = kCLLocationAccuracyBest
        geoManager.distanceFilter = kCLDistanceFilterNone
        geoManager.requestWhenInUseAuthorization()
        geoManager.startUpdatingLocation()
        geoManager.delegate = self
    }
}

extension GeolocationManager: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        self.location = location
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
    }
}
