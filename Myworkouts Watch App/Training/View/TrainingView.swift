//
//  TrainingView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

struct TrainingView: View {
    @ObservedObject var countDownVM = CountDownViewModel()
    @ObservedObject var viewModel = TrainingViewModel()
    @State private var selection: Tab = .duration
    @State private var isFirstScreen: Bool = true
    @State var selectedIndex: Int = 0{
        didSet{
            print("self.dkadka = \(self.selectedIndex)")
        }
    }
    
    
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                TrainingDurationView(viewModel: viewModel,countDownVM: countDownVM).tag(Tab.duration).onAppear{
                    if(isFirstScreen){
                        viewModel.selectedIndex = selectedIndex
                        countDownVM.startTimerButt(mins: selectedIndex, secs: 0)
                        isFirstScreen = false
                    }
                }
                TrainingLiveDataView().tag(Tab.metrics)
            }
        }
        .navigationTitle("Training")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}

