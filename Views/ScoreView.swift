import SwiftUI

struct ScoreView: View {
    @StateObject private var viewModel: OutcomeViewModel

    init(champion: String, finalScore :Int){
        _viewModel = StateObject(wrappedValue: OutcomeViewModel(winnerName:champion, score: finalScore))
    }

    var body: some View {
        VStack{
            VStack {
                //Header
                Text(viewModel.winnerLabel)
                    .font(.system(size: 30))
                    .foregroundColor(Color.green)
                    .bold()


                Text(viewModel.result)
                    .font(.system(size: 30))
                    .foregroundColor(Color.green)
                    .bold()

                Button {
                    viewModel.returnToMenu()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.green)
                            .frame(width: 125, height: 50)
                        Text("Back To Menu")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }.padding()

            }.padding(.top, 30)

            NavigationLink(destination: LandmarksView(viewModel: PrimaryViewModel()),isActive: $viewModel.back){}.hidden()
        }
    }
}
