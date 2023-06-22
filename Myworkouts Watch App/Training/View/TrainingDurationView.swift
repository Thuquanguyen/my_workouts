//
//  DurationView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 12/06/2023.
//

import SwiftUI

struct TrainingDurationView<Model,VM>: View where Model: CountDownViewModel,VM: TrainingViewModel {
    @ObservedObject var viewModel: VM
    @ObservedObject var countDownVM: Model
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack {
                ConfirmView(title: "Are you sure\nyou want to\nend this training?") {
                    viewModel.showConf = false
                } yesButtonAction: {
                    viewModel.showConf = false
                    viewModel.isSave = true
                    countDownVM.timerActionButton()
                }.isHidden(!viewModel.showConf)
                StartView.isHidden(viewModel.showConf)
        }
    }
}

struct TrainingDurationView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDurationView(viewModel: TrainingViewModel(), countDownVM: CountDownViewModel())
    }
}

extension TrainingDurationView{
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
                    Text(String(format: "%0.2d:%0.2d", viewModel.selectedIndex,0)).foregroundColor(Color(hex: 0xA2A2A2)).font(.system(size: 22))
                }.padding()
                Spacer()
                VStack{
                    Text("Time left").foregroundColor(Color(hex: 0x494B4E)).font(.system(size: 12))
                    Text("(\(countDownVM.timeleft))").foregroundColor(Color(hex: 0xA2A2A2)).font(.system(size: 22))
                }.padding()
            }
            if(viewModel.isSave){
                Button(action: {
                    viewModel.saveData()
                }, label: {
                    Text("Save").font(.headline).padding(.zero)
                })
                    .background(Color(hex: 0x4654EA))
                    .cornerRadius(20)
            }else{
                HStack{
                    Spacer()
                    Button(action: {
                        viewModel.showConf = true
//                        countDownVM.reset()
                    }, label: {
                        Text("End").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(.red)
                    }).buttonStyle(PlainButtonStyle()).background(Color(hex: 0x494A4C)).borderRadius(Color(hex: 0x4A2E2C), width: 3, cornerRadius: 20, corners: [.topLeft, .bottomLeft])
                    Spacer()
                        ZStack{
                            Button(action: {
                                viewModel.isPause = true
                                countDownVM.timerActionButton()
                            }, label: {
                                Text("Paus").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(Color(hex: 0x08D18E))
                            }).buttonStyle(PlainButtonStyle()).background(.black).borderRadius(Color(hex: 0x09E099), width: 3, cornerRadius: 20, corners: [.topRight, .bottomRight]).isHidden(viewModel.isPause)
                            
                            Button(action: {
                                viewModel.isPause = false
                                countDownVM.timerActionButton()
                            }, label: {
                                Text("Continue").font(.subheadline).padding().frame(maxWidth: .infinity).foregroundColor(.white)
                            }).buttonStyle(PlainButtonStyle()).background(Color(hex: 0x4654EA)).cornerRadius(20, corners: [.topRight,.bottomRight]).isHidden(!viewModel.isPause)
                        }
                    Spacer()
                }.mask(RoundedRectangle(cornerRadius: 25))
            }
        }
    }
}
