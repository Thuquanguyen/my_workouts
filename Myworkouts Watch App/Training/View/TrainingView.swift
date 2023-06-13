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
        TabView(selection: $selection) {
            TrainingDurationView().tag(Tab.duration)
            TrainingLiveDataView().tag(Tab.metrics)
        }
        .navigationTitle("Training")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
    }
}

