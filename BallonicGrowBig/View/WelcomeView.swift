import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Image("WelcomeBackground\(viewModel.pageWelcome)")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            VStack {
                Spacer()
                
                ZStack {
                    Button {
                        withAnimation() {
                            viewModel.pageWelcome += 1
                        }
                    } label: {
                        Image("WelcomeButton0")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    }
                    .opacity(viewModel.pageWelcome == 0 ? 1 : 0)
                    
                    HStack {
                        Button {
                            withAnimation() {
                                viewModel.isWelcome = false
                                
                                viewModel.dateWelcome = 2
                                viewModel.saveUserDefaults()
                            }
                        } label: {
                            Image("WelcomeButton2")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                        }
                        .padding(.trailing, -25.0)
                        
                        Button {
                            withAnimation() {
                                if viewModel.pageWelcome < 4 {
                                    withAnimation() {
                                        viewModel.pageWelcome += 1
                                    }
                                } else {
                                    withAnimation() {
                                        viewModel.isWelcome = false
                                        
                                        viewModel.dateWelcome = 2
                                        viewModel.saveUserDefaults()
                                    }
                                }
                            }
                        } label: {
                            Image("WelcomeButton1")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                        }
                    }
                    .opacity(viewModel.pageWelcome == 0 ? 0 : 1)
                }
            }
        }
    }
}
