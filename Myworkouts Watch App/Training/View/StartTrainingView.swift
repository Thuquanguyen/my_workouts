//
//  StartTrainingView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 22/06/2023.
//

import SwiftUI

struct StartTrainingView: View {
    @ObservedObject var viewModel = TrainingViewModel()
    var body: some View {
        VStack {
            Spacer()
            SelectedView(title: "Planned Duration") { value in
                viewModel.selectedIndex = value
            }
            NavigationLink(destination: TrainingView(selectedIndex: viewModel.selectedIndex)) {
                Text("Start").font(.headline)
                    .padding(EdgeInsets(top: 8, leading: 0, bottom:
                                            8, trailing: 0))
                .frame(maxWidth: .infinity)
                .background(Color(hex: 0x09E099))
                .foregroundColor(.white)
                .cornerRadius(8)
            }.buttonStyle(PlainButtonStyle()).padding(.zero).background(Color(hex: 0x09E099)).cornerRadius(80)
            Spacer()
        }.navigationTitle("Session")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct StartTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        StartTrainingView()
    }
}
