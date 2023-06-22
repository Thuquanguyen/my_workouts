//
//  PlayerView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            NavigationLink(destination: StartTrainingView()) {
                Text("Training")
                    .font(.headline)
            }.background(viewModel.backgroundColor)
                .cornerRadius(20)
            Spacer()
                    .frame(height: 10)
            NavigationLink(destination: MatchView()) {
                Text("Match")
            }.background(viewModel.backgroundColor)
                .cornerRadius(20)
            Spacer()
                    .frame(height: 10)
            NavigationLink(destination: PlayerView()) {
                Text("Test")
            }.background(viewModel.backgroundColor)
                .cornerRadius(20)
        }.navigationTitle("Session")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
