import Foundation

class PrimaryViewModel: ObservableObject{
    @Published var middle = 34.817549168324334

    @Published var playerName : String = ""
    @Published var title : String = "Hi "
    @Published var errorText = ""
    @Published var isNavigationActive = false
    @Published var displayLocation = false
    @Published var isWestern = false
    @Published var isPlayModeReady = false
    
    init(){
        
    }
    
    func setPlayerName(){
        guard !playerName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorText = "Please Fill Your Name"
            return
        }
        title = "Hi " + playerName
        isNavigationActive = true
    }
    
    func validateLandmarks(latitude: Double, longitude: Double){
        if longitude < middle{
            isWestern = true
        }else{
            isWestern = false
        }
        displayLocation = true
    }
    
    func initiatePlay(){
        isPlayModeReady = true
    }
    
}
