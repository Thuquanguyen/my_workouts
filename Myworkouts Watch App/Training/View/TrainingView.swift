//
//  TrainingView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

struct TrainingView: View {
    @ObservedObject var viewModel = TrainingViewModel()
    @State private var selection: Tab = .duration
    
    var body: some View {
        ZStack{
                SelectView.isHidden(!viewModel.isStart)
                TabView(selection: $selection) {
                    TrainingDurationView(viewModel: viewModel).tag(Tab.duration)
                    TrainingLiveDataView().tag(Tab.metrics)
                }.isHidden(viewModel.isStart)
        }
        .navigationTitle("Training")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(viewModel.isHiddenBack)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}
extension TrainingView{
    var SelectView: some View{
        VStack {
            SelectedView(title: "Planned Duration") { value in
                viewModel.selectedIndex = value
            }
            Button(action: {
                viewModel.isStart = !viewModel.isStart
                viewModel.countDownVM.start(minutes: Float(viewModel.selectedIndex))
                viewModel.isHiddenBack = true
            }, label: {
                Text("Start").font(.headline).padding(.zero)
            })
            .padding(.zero)
            .background(Color(hex: 0x09E099))
            .cornerRadius(20)
        }
    }
}


struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}

