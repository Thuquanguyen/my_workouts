//
//  CustomButton.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 20/06/2023.
//

import Foundation
import SwiftUI

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
