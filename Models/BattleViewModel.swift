import Foundation

class BattleViewModel : ObservableObject{
    @Published var userScore = 0
    @Published var computerScore = 0
    @Published var matchCount :Int = 0
    @Published var isMatchOver = false
    @Published var userName :String = ""
    @Published var isUserWestern = false
    @Published var computerAlignment = ""
    @Published var totalMatches = 0
    @Published var userCard: Card
    @Published var computerCard: Card
    @Published var matchWinner :String = ""
    @Published var matchWinnerScore = 0
    @Published var card_back = Card(image: "backside", value:-1)
    
    @Published var cards = [Card(image:"Martinez",value:84)
                           ,Card(image:"Halland",value:96)
                           ,Card(image:"Mbappe" , value:80)
                           ,Card(image:"Man" , value :89 )
                           ,Card(image :"Neuer" , value:90)
                           ,Card(image: "Marquinhos",value:88)
                           ,Card(image: "Benzema", value:91)
                            ,Card(image:"Messi",value:94)]
   
                           
    

    init(isWestern: Bool, name: String) {
        let card_back1 = Card(image: "backside", value:-1)
        userName = name
        isUserWestern = isWestern
        userCard = card_back1
        computerCard = card_back1
        isMatchOver = false
        matchCount = 0
        userScore = 0
        computerScore = 0
        beginRoundTimer()
    }
    


     func  createRandomCard() -> Card {
         let pos = Int.random(in: 0...cards.count-1)
          return cards[pos]
     
      }
    
    func assignRandomCardToUser() {
        userCard =  self.createRandomCard()

        computerCard = self.createRandomCard()
        
    }

    
    func assignBacksideCards() {

        userCard = self.card_back

        computerCard = self.card_back
        
    }
    
    private func beginRoundTimer() {
        var roundCounter = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            if roundCounter % 3 == 0 {

                self?.assignBacksideCards()
              
            }
            
            if roundCounter % 5 == 0 {
                roundCounter = 0
                self?.matchCount += 1
   
                self?.assignRandomCardToUser()
                self?.revealCards()

            }
            
            if self?.matchCount == 10 {
                self?.terminateMatch()
                timer.invalidate()
            }
            
            roundCounter += 1
        }
    }
    
    private func revealCards() {
        
        if userCard.value > computerCard.value {
            userScore += 1
        } else if userCard.value < computerCard.value {
            computerScore += 1
        }
    }
    
    private func terminateMatch() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            self?.identifyWinner()
            self?.isMatchOver = true
            timer.invalidate()
        }
    }
    
    private func identifyWinner() {
        if userScore > computerScore {
            matchWinner = userName
            matchWinnerScore = userScore
        }else {
            matchWinner = "Computer"
            matchWinnerScore = computerScore
        }
    }
    
}
