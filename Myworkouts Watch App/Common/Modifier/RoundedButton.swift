//
//  RoundedButtonModifier.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 6/9/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
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
