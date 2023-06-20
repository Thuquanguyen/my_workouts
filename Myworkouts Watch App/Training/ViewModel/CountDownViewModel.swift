//
//  CountDownViewModel.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 20/06/2023.
//

import Foundation
import SwiftUI

final class CountDownViewModel: ObservableObject,Identifiable{
    @Published var isActive = false
    @Published var showingAlert = false
    @Published var time: String = "00:00"
    @Published var minutes: Float = 00.0 {
        didSet{
            self.time = "\(Int(minutes)):00"
        }
    }
    @Published var initalTime = 0
    @Published var endDate = Date()
    
    func start(minutes: Float){
        print("minutes  = \(minutes)")
        self.initalTime = Int(minutes)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(bySetting: .minute, value: Int(minutes), of: endDate)!
        print("minutes  = \(isActive)")
    }
    
    func reset(){
        print("RESSETTTTT")
        self.minutes = Float(initalTime)
        self.isActive = false
        self.time = "\(Int(minutes)):00"
    }
    
    func updateCountdown(){
        print("activeeeee = \(self.isActive)")
        guard isActive else {return}
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= 0 {
            self.isActive = false
            self.time = "00:00"
            self.showingAlert = false
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        self.minutes = Float(minutes)
        self.time = String(format: "%d:%0.2d", minutes,seconds)
        print("TIME TIME TIME = \(self.time)")
    }
}
