import SwiftUI

struct CreateView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var floating = false
    
    var body: some View {
        ZStack {
            ZStack {
                Image("MenuBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        VStack {
                            Image("DaylineTitle0")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            ZStack {
                                ZStack {
                                    Image("DaylinePlusImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 37.5)
                                }
                                .padding(.top, 5.0)
                                
                                HStack {
                                    Button {
                                        if viewModel.createEntry.type0 < 2 {
                                            withAnimation() {
                                                viewModel.createEntry.type0 += 1
                                            }
                                        } else {
                                            withAnimation() {
                                                viewModel.createEntry.type0 = 0
                                            }
                                        }
                                    } label: {
                                        Image("DaylineLeftButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 32)
                                    }
                                    
                                    HStack {
                                        ZStack {
                                            Image("DaylineType\(viewModel.createEntry.type0)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 130)
                                        }
                                        .padding(.trailing, -5.0)
                                        
                                        ZStack {
                                            Image("DaylineType\(viewModel.createEntry.type1)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 130)
                                        }
                                        .padding(.leading, -5.0)
                                    }
                                    .padding(.top, -10.0)
                                    .padding(.horizontal, -45.0)
                                    
                                    Button {
                                        if viewModel.createEntry.type1 < 5 {
                                            withAnimation() {
                                                viewModel.createEntry.type1 += 1
                                            }
                                        } else {
                                            withAnimation() {
                                                viewModel.createEntry.type1 = 3
                                            }
                                        }
                                    } label: {
                                        Image("DaylineRightButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 32)
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            Image("DaylineTitle1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            VStack {
                                ForEach(0..<2) { index in
                                    HStack {
                                        ForEach(0..<3) { jndex in
                                            Image("TimeSelector\(3 * index + jndex)\(viewModel.createEntry.time == 3 * index + jndex ? 1 : 0)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 40)
                                                .onTapGesture() {
                                                    withAnimation() {
                                                        viewModel.createEntry.time = 3 * index + jndex
                                                    }
                                                }
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            Image("DaylineTitle2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            VStack {
                                HStack {
                                    ForEach(0..<3) { index in
                                        Image("PlaceSelector\(index)\(viewModel.createEntry.location == index ? 1 : 0)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 40)
                                            .onTapGesture() {
                                                withAnimation() {
                                                    viewModel.createEntry.location = index
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            Image("DaylineTitle3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            ZStack {
                                Image("DaylinePlaceholder\(viewModel.createEntry.hands == "" ? 0 : 1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 345)
                                
                                ZStack {
                                    HStack {
                                        TextField("None, Water, Mat, Headphones...", text: $viewModel.createEntry.hands)
                                            .font(.system(size: 15))
                                            .fontWeight(.black)
                                            .foregroundColor(Color(#colorLiteral(red: 0.3383591175, green: 0.4907429814, blue: 0.9352513552, alpha: 1)))
                                            .multilineTextAlignment(.leading)
                                            .frame(width: 310)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 310)
                                    
                                    HStack {
                                        Text("None, Water, Mat, Headphones...")
                                            .font(.system(size: 15))
                                            .fontWeight(.black)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(1)
                                            .allowsHitTesting(false)
                                            .opacity(viewModel.createEntry.hands == "" ? 0.75 : 0)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 310)
                                }
                            }
                        }
                        
                        VStack {
                            Image("DaylineTitle4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            ZStack {
                                Image("DaylinePlaceholder\(viewModel.createEntry.intention == "" ? 0 : 1)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 345)
                                
                                ZStack {
                                    HStack {
                                        TextField("Your preference or constraint...", text: $viewModel.createEntry.intention)
                                            .font(.system(size: 15))
                                            .fontWeight(.black)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(Color(#colorLiteral(red: 0.3383591175, green: 0.4907429814, blue: 0.9352513552, alpha: 1)))
                                            .frame(width: 310)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 310)
                                    
                                    HStack {
                                        Text("Your preference or constraint...")
                                            .font(.system(size: 15))
                                            .fontWeight(.black)
                                            .foregroundColor(.white)
                                            .multilineTextAlignment(.leading)
                                            .lineLimit(1)
                                            .allowsHitTesting(false)
                                            .opacity(viewModel.createEntry.intention == "" ? 0.75 : 0)
                                        
                                        Spacer()
                                    }
                                    .frame(width: 310)
                                }
                            }
                        }
                        
                        HStack {
                            Button {
                                withAnimation() {
                                    viewModel.isCreate = false
                                }
                            } label: {
                                Image("TaskButton2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                            }
                            
                            Spacer()
                            
                            Button {
                                let random = Int.random(in: 0...4)
                                
                                viewModel.daylines.append(Dayline(id: viewModel.daylines.count, time: viewModel.createEntry.time, location: viewModel.createEntry.location, type0: viewModel.createEntry.type0, type1: viewModel.createEntry.type1, title: viewModel.habitSlogans[viewModel.getIndexFromMixHabits(viewModel.createEntry.type0, viewModel.createEntry.type1)], habit: viewModel.habitTasks[viewModel.getIndexFromMixHabits(viewModel.createEntry.type0, viewModel.createEntry.type1)][random], text: viewModel.habitExplanations[viewModel.getIndexFromMixHabits(viewModel.createEntry.type0, viewModel.createEntry.type1)][random], isDone: false))
                                
                                viewModel.todayCreated += 1
                                viewModel.checkDailyTask()
                                
                                viewModel.saveDaylines()
                                viewModel.updateDaylineStats()
                                
                                withAnimation() {
                                    viewModel.isOnLoading = true
                                    viewModel.isLoading = true
                                }
                            } label: {
                                Image("TaskButton1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 50)
                            }
                        }
                        .frame(width: 345)
                    }
                    .padding(.vertical, 15.0)
                }
            }
            
            ZStack {
                Image("MenuBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                
                VStack {
                    Text("\(viewModel.loadingProgress)%")
                        .font(.system(size: 128))
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .opacity(0.075)
                    
                    Spacer()
                }
                .zIndex(1)
                .padding(.vertical, 15.0)
                
                VStack {
                    ZStack {
                        Image("Loading\(viewModel.getIndexFromMixHabits(viewModel.createEntry.type0, viewModel.createEntry.type1))")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 405)
                            .zIndex(2)
                    }
                    .offset(y: floating ? -5 : 5)
                    .animation(
                        Animation.easeInOut(duration: 1.5)
                            .repeatForever(autoreverses: true),
                        value: floating
                    )
                    .onAppear {
                        floating = true
                    }
                    
                    ZStack {
                        Image("LoadingTitle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 57.5)
                    }
                }
            }
            .opacity(viewModel.isLoading ? 1 : 0)
        }
    }
}
