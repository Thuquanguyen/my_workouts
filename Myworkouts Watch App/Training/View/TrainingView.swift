//
//  TrainingView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

struct TrainingView: View {
    @EnvironmentObject var countDownVM: CountDownViewModel
    @StateObject var viewModel = TrainingViewModel()
    @State private var selection: Tab = .duration
    @State private var isFirstScreen: Bool = true
    @State private var isFirstWorkout: Bool = true
    @EnvironmentObject var workoutManager: WorkoutManager
    @State var selectedIndex: Int = 0
    
    
    var body: some View {
        VStack{
            TabView(selection: $selection) {
                TrainingDurationView(viewModel: viewModel).environmentObject(countDownVM).environmentObject(workoutManager).tag(Tab.duration)
                TrainingLiveDataView(viewModel: viewModel).environmentObject(workoutManager).tag(Tab.metrics)
            }.onAppear{
                if(isFirstScreen){
                    print("selectedIndexselectedIndex = \(selectedIndex)")
                    viewModel.selectedIndex = selectedIndex
                    countDownVM.startTimerButt(mins: selectedIndex, secs: 0)
                    isFirstScreen = false
                }
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
        TrainingView().environmentObject(WorkoutManager()).environmentObject(CountDownViewModel())
    }
}

