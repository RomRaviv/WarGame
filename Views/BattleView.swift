import SwiftUI

struct BattleView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel: BattleViewModel

    init(isWestern: Bool, playerName: String) {
        _viewModel = StateObject(wrappedValue: BattleViewModel(isWestern: isWestern, name: playerName))
    }
    
    var body: some View {
        ZStack{
            Image("field")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    if viewModel.isUserWestern {
                        VStack{
                            Text(viewModel.userName)
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.userScore)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                        Image("logo")
                        Spacer()
                        VStack{
                            Text("Computer")
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.computerScore)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    } else {
                        VStack{
                            Text("Computer")
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.computerScore)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                        Image("logo")
                        Spacer()
                        
                        VStack{
                            Text(viewModel.userName)
                                .font(.headline)
                                .padding(.bottom,2)
                            Text("\(viewModel.userScore)")
                                .font(.largeTitle)
                        }.alignmentGuide(.leading) { _ in
                            0
                        }
                        Spacer()
                    }
                    
                }.foregroundColor(.black)
                
                HStack{
                    Spacer()
                    Image(viewModel.userCard.image).resizable().frame(width: 150, height: 250)
                    Spacer()

                    Spacer()
                    Image(viewModel.computerCard.image).resizable().frame(width: 150, height: 250)
                    Spacer()
                }
                Spacer()
            }
            
            NavigationLink(destination: ScoreView(champion: viewModel.matchWinner, finalScore: viewModel.matchWinnerScore), isActive: $viewModel.isMatchOver){}.hidden()
        }
    }
}


