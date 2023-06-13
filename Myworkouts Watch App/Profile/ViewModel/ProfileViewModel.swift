//
//  ProfileViewModel.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import Foundation
import UIKit
import SwiftUI

class ProfileViewModel: ObservableObject, Identifiable {
    
    var backgroundColor: Color = Color(hex: 0x222224)
    
    func changeBackground(){
        print("chjange change change")
        backgroundColor = .blue
    }
}
