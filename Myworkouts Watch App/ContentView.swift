//
//  ContentView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ProfileView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomButtons: View {
    // Action button properties
    var rightButtonText: String? = nil
    var leftButtonText: String? = nil
    var rightButtonAction: () -> Void = {}
    var leftButtonAction: () -> Void = {}
    
    var body: some View {
        HStack {
            Button(action: { leftButtonAction() }) {
                Text("No").padding()
                    .frame(minWidth: 0, maxWidth: .infinity) // trick to make them equally-sized
                    .background (
                        Color.yellow
                    )
            }
            
            Button(action: { rightButtonAction() }) {
                Text("Yes").padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background (
                        Color.yellow
                    )
            }
        }
        .mask {
            RoundedRectangle(cornerRadius: 25)
            // or Capsule()
        }
        .frame(width: 300)
    }
}
