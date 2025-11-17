import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State private var moveUpDown = false
    
    var body: some View {
        ZStack {
            Image("SplashBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            Image("SplashLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 175)
            
            VStack {
                Spacer()
                
                Image("SplashFrame")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 0.0)
                    .offset(y: moveUpDown ? 40 : 0)
                    .animation(
                        Animation.easeInOut(duration: 1.5)
                            .repeatForever(autoreverses: true),
                        value: moveUpDown
                    )
            }
            .ignoresSafeArea()
        }
        .onAppear {
            moveUpDown.toggle()
        }
    }
}
