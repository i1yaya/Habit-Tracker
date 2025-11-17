import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Image("MenuBackground")
                .resizable()
                .ignoresSafeArea()
                .padding(.all, 0.0)
            
            ZStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ZStack {
                            Image("MenuMainFrame")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                    ZStack {
                                        let percentage = Int((Double(viewModel.currentScore) / Double(viewModel.targets[viewModel.numberOfLevel])) * 100)
                                        
                                        VStack {
                                            HStack {
                                                Text("\(viewModel.currentScore) sparks of \(viewModel.targets[viewModel.numberOfLevel]) collected")
                                                    .font(.system(size: 11))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 2)
                                                    .opacity(0.5)
                                                
                                                Spacer()
                                                
                                                Text("\(percentage)%")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.black)
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 2)
                                            }
                                            
                                            HStack {
                                                ForEach(0..<4) { index in
                                                    Image("MenuMain\(percentage >= 25 * (index + 1) ? 1 : 0)")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 9)
                                                }
                                            }
                                        }
                                    }
                                    .frame(height: 40)
                                    .frame(width: 255)
                                }
                                .frame(width: 310)
                                
                                Spacer()
                            }
                            .frame(height: 120)
                            
                            VStack {
                                Spacer()
                                
                                ZStack {
                                    VStack {
                                        HStack {
                                            VStack {
                                                HStack {
                                                    Text(viewModel.taskActive ? "\(viewModel.titles[viewModel.taskNumber])" : "Completed!")
                                                        .font(.system(size: 17))
                                                        .fontWeight(.black)
                                                        .foregroundColor(.white)
                                                        .shadow(radius: 2)
                                                    
                                                    Spacer()
                                                }
                                                
                                                HStack {
                                                    Text("\(viewModel.tasks[viewModel.taskNumber])")
                                                        .font(.system(size: 12))
                                                        .fontWeight(.medium)
                                                        .foregroundColor(.white)
                                                        .shadow(radius: 2)
                                                        .opacity(viewModel.taskActive ? 0.65 : 0.35)
                                                    
                                                    Spacer()
                                                }
                                            }
                                            
                                            Spacer()
                                            
                                            HStack {
                                                Text("+\(viewModel.rewards[viewModel.taskNumber])")
                                                    .font(.system(size: 12))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                                    .shadow(radius: 2)
                                                    .opacity(viewModel.taskActive ? 0.65 : 0.35)
                                                
                                                ZStack {
                                                    Image("MenuRewardIcon")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 14)
                                                }
                                                .opacity(viewModel.taskActive ? 1 : 0.5)
                                                .padding(.leading, -2.5)
                                            }
                                        }
                                    }
                                }
                                .frame(height: 65)
                                .frame(width: 310)
                            }
                            .frame(height: 120)
                        }
                        
                        HStack {
                            Image("MenuTitle")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                            
                            Spacer()
                        }
                        .padding(.top, 10.0)
                        .padding(.horizontal, 27.5)
                        
                        VStack {
                            ForEach(0..<3) { index in
                                HStack {
                                    ForEach(0..<2) { jndex in
                                        Image("MenuButton\(2 * index + jndex)")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 217.5)
                                            .onTapGesture() {
                                                viewModel.pageTask = 0
                                                viewModel.typeTask = 2 * index + jndex
                                                
                                                withAnimation() {
                                                    viewModel.isTask = true
                                                }
                                            }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 25.0)
                    }
                    .padding(.top, 15.0)
                    .padding(.bottom, 125.0)
                }
            }
            .opacity(viewModel.tabBarPage == 0 ? 1 : 0)
            
            ZStack {
                Image("DaylineBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .padding(.all, 0.0)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ZStack {
                            Image("DaylineEmptyGround\(viewModel.daylineField)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 345)
                            
                            VStack {
                                HStack {
                                    Text("\(viewModel.daylinePercentage)%")
                                        .font(.system(size: 48))
                                        .foregroundColor(.white)
                                        .fontWeight(.black)
                                        .shadow(radius: 2)
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                            }
                            .frame(width: 305, height: 150)
                            .opacity(viewModel.daylineField == 9 ? 0 : 1)
                            
                            VStack {
                                Text("\(viewModel.currentWeekdayName())")
                                    .font(.system(size: 9))
                                    .foregroundColor(.white)
                                    .fontWeight(.black)
                                    .shadow(radius: 2)
                                    .opacity(0.65)
                                
                                Spacer()
                            }
                            .frame(height: 190)
                        }
                        
                        Button {
                            viewModel.setupCreate()
                        } label: {
                            Image("DaylineCreateButton")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 32.5)
                        }
                        .zIndex(2)
                        .padding(.top, -20.0)
                        
                        if viewModel.daylines.count <= 0 {
                            ZStack {
                                Image("DaylineEmptyField")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 345)
                            }
                            .zIndex(1)
                            .padding(.top, -10.0)
                        } else {
                            VStack {
                                ForEach(viewModel.daylines) { dayline in
                                    ZStack {
                                        let type0 = dayline.type0 == 0 ? "Connection" : dayline.type0 == 1 ? "Energy" : "Order"
                                        let type1 = dayline.type1 == 3 ? "Calm" : dayline.type1 == 4 ? "Focus" : "Inspiration"
                                        
                                        Image("DaylineCard")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 345)
                                        
                                        VStack {
                                            HStack {
                                                Image("TimeSelector\(dayline.time)0")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 25)
                                                
                                                Image("PlaceSelector\(dayline.location)0")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 25)
                                                
                                                Spacer()
                                            }
                                            
                                            HStack {
                                                Text("\(dayline.title)")
                                                    .font(.system(size: 13))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                                    .shadow(radius: 2)
                                                    .opacity(0.85)
                                                
                                                Spacer()
                                                
                                                Text("\(type0) & \(type1)")
                                                    .font(.system(size: 9))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.light)
                                                    .shadow(radius: 2)
                                                    .opacity(0.65)
                                            }
                                            .padding(.top, 10.0)
                                            
                                            HStack {
                                                Text("\(dayline.habit)")
                                                    .font(.system(size: 15))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.black)
                                                    .multilineTextAlignment(.leading)
                                                    .shadow(radius: 2)
                                                
                                                Spacer()
                                            }
                                            
                                            VStack {
                                                HStack {
                                                    Text("\(dayline.text)")
                                                        .font(.system(size: 12))
                                                        .foregroundColor(.white)
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.leading)
                                                        .shadow(radius: 2)
                                                        .lineLimit(5)
                                                        .opacity(0.65)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.top, 5.0)
                                            }
                                            .frame(width: 320)
                                            
                                            Spacer()
                                        }
                                        .frame(width: 320, height: 205)
                                        
                                        VStack {
                                            Spacer()
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    withAnimation() {
                                                        viewModel.daylines.remove(at: dayline.id)
                                                        
                                                        if viewModel.daylines.count > 0 {
                                                            for index in 0...viewModel.daylines.count - 1 {
                                                                viewModel.daylines[index].id = index
                                                            }
                                                        }
                                                        
                                                        viewModel.updateDaylineStats()
                                                        viewModel.saveDaylines()
                                                    }
                                                } label: {
                                                    Image("DaylineDeleteButton")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 35)
                                                }
                                                
                                                Button {
                                                    withAnimation() {
                                                        viewModel.daylines[dayline.id].isDone.toggle()
                                                        viewModel.saveDaylines()
                                                    }
                                                } label: {
                                                    Image("DaylineDoneButton")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: 35)
                                                }
                                            }
                                        }
                                        .frame(width: 320, height: 215)
                                    }
                                    .opacity(dayline.isDone ? 0.25 : 1.0)
                                }
                            }
                        }
                    }
                    .padding(.top, 15.0)
                    .padding(.bottom, 125.0)
                }
            }
            .opacity(viewModel.tabBarPage == 2 ? 1 : 0)
            
            VStack {
                Spacer()
                
                ZStack {
                    Image("TabBarBackground")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 0.0)
                    
                    HStack {
                        ForEach(0..<3) { index in
                            if index == 1 {
                                ZStack {
                                    Image("TabBarButton1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 105)
                                }
                                .onTapGesture {
                                    viewModel.setupCreate()
                                }
                                .padding(.top, -75.0)
                                .padding(.horizontal, 35.0)
                            } else {
                                ZStack {
                                    Image("TabBarButton\(index)\(viewModel.tabBarPage == index ? 1 : 0)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                }
                                .onTapGesture {
                                    withAnimation() {
                                        viewModel.tabBarPage = index
                                    }
                                }
                                .padding(.top, -10.0)
                            }
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}
