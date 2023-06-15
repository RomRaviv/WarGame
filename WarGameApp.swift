
import SwiftUI

@main
struct WarGameApp: App {
    @StateObject var locationManager = GeolocationManager()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(locationManager)
        }
    }
}
