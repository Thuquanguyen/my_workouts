//
//  DurationView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 12/06/2023.
//

import SwiftUI

struct TrainingDurationView: View {
    @ObservedObject var viewModel = TrainingViewModel()
    @StateObject private var countDownVM = CountDownViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    @State var selectedIndex = 0
    @State var isStart = true
    @State var showConf = false
    @State var isSave = false
    
    var body: some View {
        ZStack {
            if(showConf){
                ConfirmView(title: "Are you sure\nyou want to\nend this training?") {
                    showConf = false
                } yesButtonAction: {
                    showConf = false
                    isSave = true
                }
            }else{
                if(isStart){
                    SelectView
                }else{
                    StartView
                }
            }
        }
    }
}

struct TrainingDurationView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDurationView()
    }
}

extension TrainingDurationView{
    var SelectView: some View{
        VStack {
            SelectedView(title: "Planned Duration",selectedIndex: selectedIndex)
            Spacer()
                    .frame(height: 10)
            Button(action: {
                isStart = !isStart
                countDownVM.start(minutes: Float(selectedIndex))
            }, label: {
                Text("Start").font(.headline).padding(.zero)
            })
            .padding(.zero)
            .background(Color(hex: 0x09E099))
            .cornerRadius(20)
        }
    }
    
    var StartView: some View{
        VStack {
            Text("Duration")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(Color(hex: 0x818389))
                .padding(.horizontal)
            
            Text("\(countDownVM.time)").font(.system(size: 60)).fontWeight(.medium)
            Spacer()
                    .frame(height: 10)
            HStack {
                VStack{
                    Text("Total time").foregroundColor(Color(hex: 0x494B4E)).font(.system(size: 12))
                    Text("(90:00)").foregroundColor(Color(hex: 0xA2A2A2)).font(.system(size: 22))
                }.padding()
                Spacer()
                VStack{
                    Text("Time left").foregroundColor(Color(hex: 0x494B4E)).font(.system(size: 12))
                    Text("(90:01)").foregroundColor(Color(hex: 0xA2A2A2)).font(.system(size: 22))
                }.padding()
            }
            if(isSave){
                Button(action: {
                    
                }, label: {
                    Text("Save").font(.headline).padding(.zero)
                })
                    .background(Color(hex: 0x4654EA))
                    .cornerRadius(20)
            }else{
                HStack{
                    Spacer()
                    Button(action: {
                        showConf = true
                        countDownVM.reset()
                    }, label: {
                        Text("End").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(.red)
                    }).buttonStyle(PlainButtonStyle()).background(Color(hex: 0x494A4C)).borderRadius(Color(hex: 0x4A2E2C), width: 3, cornerRadius: 20, corners: [.topLeft, .bottomLeft])
                    Spacer()
                        ZStack{
                            Button(action: {
                                isStart = !isStart
                                countDownVM.reset()
                            }, label: {
                                Text("Paus").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(Color(hex: 0x08D18E))
                            }).buttonStyle(PlainButtonStyle())
                            Button(action: {
                                isStart = !isStart
                                countDownVM.reset()
                            }, label: {
                                Text("Continue").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(.white)
                            }).buttonStyle(PlainButtonStyle()).background(Color(hex: 0x4654EA)).cornerRadius(20, corners: [.topRight,.bottomRight])
                        }
                    Spacer()
                }.mask(RoundedRectangle(cornerRadius: 25))
            }
        }.onReceive(timer){ _ in
            countDownVM.updateCountdown()
        }
    }
}

extension TrainingDurationView{
    final class CountDownViewModel: ObservableObject{
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "10:00"
        @Published var minutes: Float = 10.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        @Published var initalTime = 0
        @Published var endDate = Date()
        
        func start(minutes: Float){
            print("minutes  = \(minutes)")
            self.initalTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(bySetting: .minute, value: Int(minutes), of: endDate)!
        }
        
        func reset(){
            self.minutes = Float(initalTime)
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        }
        
        func updateCountdown(){
            guard isActive else {return}
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "00:00"
                self.showingAlert = false
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%0.2d", minutes,seconds)
        }
    }
}
