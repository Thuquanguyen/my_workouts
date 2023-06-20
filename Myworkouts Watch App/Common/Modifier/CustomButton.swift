//
//  CustomButton.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 20/06/2023.
//

import Foundation
import SwiftUI

struct CustomButton: View {

@State private var didTap:Bool = false

  var body: some View {
    Button(action: {
        self.didTap = true
    }) {

    Text("My custom button")
        .font(.system(size: 24))
    }
    .frame(width: 300, height: 75, alignment: .center)
    .padding(.all, 20)
    .background(didTap ? Color.blue : Color.yellow)
  }
}
