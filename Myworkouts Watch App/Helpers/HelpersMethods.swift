//
//  HelpersMethods.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 22/06/2023.
//

import Foundation
func getSecondsToDuration(_ duration: Int) -> String {
    let seconds = duration % 60
    let minutes = (duration / 60) % 60
    let result = String(format: "%0.2d:%0.2d", minutes,seconds)
    return result
}
