//
//  ColorExtension.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/11/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import SwiftUI

extension Color {
  
  static let darkGray = Color("darkGray")
  static let athensGray = Color("athensGray")
  static let altoGray = Color("altoGray")
  static let cadetBlue = Color("cadetBlue")
  static let errorRed = Color("errorRed")
    
    init(hex: Int, opacity: Double = 1.0) {
            let red = Double((hex & 0xff0000) >> 16) / 255.0
            let green = Double((hex & 0xff00) >> 8) / 255.0
            let blue = Double((hex & 0xff) >> 0) / 255.0
            self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
        }
}

