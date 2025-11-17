import SwiftUI

struct TaskView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Image("TaskBackground\(viewModel.typeTask)\(viewModel.pageTask)")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            VStack {
                Spacer()
                
                HStack {
                    Button {
                        withAnimation() {
                            if viewModel.pageTask > 0 {
                                viewModel.pageTask -= 1
                            } else {
                                viewModel.isTask = false
                            }
                        }
                    } label: {
                        Image("TaskButton2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    Button {
                        withAnimation() {
                            if viewModel.pageTask >= 2 {
                                viewModel.isTask = false
                            } else {
                                viewModel.pageTask += 1
                            }
                        }
                    } label: {
                        ZStack {
                            Image("TaskButton1")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                            
                            Image("TaskButton0")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .opacity(viewModel.pageTask == 2 ? 1 : 0)
                        }
                    }
                }
            }
            .padding(.vertical, 15.0)
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation() {
                            viewModel.isTask = false
                        }
                    } label: {
                        Image("TaskCloseButton")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 25)
                    }
                }
                
                Spacer()
            }
            .padding(.all, 15.0)
        }
    }
}
