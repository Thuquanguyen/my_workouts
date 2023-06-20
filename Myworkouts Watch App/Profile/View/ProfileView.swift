//
//  ProfileView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: PlayerView()) {
                    Text("Player").font(.headline)
                }.background(viewModel.backgroundColor)
                .cornerRadius(20)
                Spacer()
                        .frame(height: 10)
                NavigationLink(destination: PlayerView()) {
                    Text("Coach").font(.headline)
                }.background(viewModel.backgroundColor)
                    .cornerRadius(20)
                Spacer()
                        .frame(height: 10)
                NavigationLink(destination: PlayerView()) {
                    Text("Referee").font(.headline)
                }.background(viewModel.backgroundColor)
                    .cornerRadius(20)
            }.navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
