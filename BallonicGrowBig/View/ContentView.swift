import SwiftUI
import Combine

struct ContentView: View {
    let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            MenuView(viewModel: self.viewModel)
            
            TaskView(viewModel: self.viewModel)
                .opacity(viewModel.isTask ? 1 : 0)
            
            CreateView(viewModel: self.viewModel)
                .opacity(viewModel.isCreate ? 1 : 0)
            
            WelcomeView(viewModel: self.viewModel)
                .opacity(viewModel.isWelcome ? 1 : 0)
        }
        .onReceive(timer) { _ in
            if viewModel.isOnLoading {
                if viewModel.loadingProgress < 100 {
                    viewModel.loadingProgress += 1
                } else {
                    viewModel.isOnLoading = false
                    
                    withAnimation() {
                        viewModel.isCreate = false
                    }
                }
            }
        }
        .onAppear() {
            viewModel.loadDaylines()
            viewModel.loadUserDefaults()
            viewModel.setupDailyTask()
            viewModel.convertationScoreToLevel()
            viewModel.updateDaylineStats()
            
            viewModel.pageWelcome = 0
            if viewModel.dateWelcome == 2 {
                viewModel.isWelcome = false
            } else {
                viewModel.isWelcome = true
            }
        }
    }
}
