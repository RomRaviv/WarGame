import SwiftUI

struct PlayerNameView: View {
    @ObservedObject var viewModel: PrimaryViewModel

    var body: some View {
        NavigationView{
            VStack{
                VStack {
                    //Header
                    Text(viewModel.title)
                        .font(.system(size: 20))
                        .foregroundColor(Color.green)
                        .bold()
                }.padding(.top, 30)

                //Name Form
                Form{
                    if !viewModel.errorText.isEmpty{
                        Text(viewModel.errorText)
                            .foregroundColor(Color.black)
                    }
                    TextField("Enter Your Name",text: $viewModel.playerName)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                
                //Button
                Button {
                    viewModel.setPlayerName()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius:2)
                            .foregroundColor(Color.green)
                            .frame(width: 100, height: 30)
                        Text("SUBMIT")
                            .foregroundColor(Color.white)
                            .bold()
                        
                    }
                }.padding()
                
                Spacer()

                NavigationLink(destination: LandmarksView(viewModel: viewModel),isActive: $viewModel.isNavigationActive){}.hidden()

            }
        }
    }
}
