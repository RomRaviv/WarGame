import SwiftUI

struct MainView: View {
    @EnvironmentObject var locationManager : GeolocationManager
    @StateObject var viewModel = PrimaryViewModel()
   
    var body: some View {
        if !viewModel.isNavigationActive{
            PlayerNameView(viewModel: viewModel)
        }  else{
            LandmarksView(viewModel: viewModel).environmentObject(locationManager)
        }   }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(GeolocationManager())
    }
}
