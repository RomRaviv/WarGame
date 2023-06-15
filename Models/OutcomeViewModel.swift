import Foundation

class OutcomeViewModel: ObservableObject{
    @Published var winnerLabel: String = ""
    @Published var result : String = ""
    @Published var back = false

    init(winnerName: String, score: Int)
    {
        winnerLabel = "Winner " + winnerName
        result = "Score : \(score)"
    }
    
    func returnToMenu(){
        back = true
    }

}
