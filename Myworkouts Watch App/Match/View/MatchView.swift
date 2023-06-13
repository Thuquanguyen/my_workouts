//
//  MatchView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 14/06/2023.
//

import SwiftUI

struct MatchView: View {
    @ObservedObject var viewModel = MatchViewModel()
    @State private var selection: Tab = .duration
    
    var body: some View {
        TabView(selection: $selection) {
            TrainingDurationView().tag(Tab.duration)
            TrainingLiveDataView().tag(Tab.metrics)
        }
        .navigationTitle("Match")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}

