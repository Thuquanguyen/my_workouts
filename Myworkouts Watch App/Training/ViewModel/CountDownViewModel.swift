//
//  CountDownViewModel.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 20/06/2023.
//

import Foundation
import SwiftUI

final class CountDownViewModel: ObservableObject,Identifiable{
    @Published var time: String = "00:00"
    @Published var timeleft: String = "00:00"
    
    var timer = Timer()
    var timerLeft = Timer()
    
    @Published var timerActive = false
    @Published var duration = 0.0
    {
        didSet{
            self.time = getSecondsToDuration(Int(self.duration))
        }
    }
    
    @Published var durationLeft = 0.0
    {
        didSet{
            self.timeleft = getSecondsToDuration(Int(self.durationLeft))
        }
    }
        
    init() { }
    
    func setTimer(minutes: Int, seconds: Int) {
        let  mins = minutes * 60, secs = seconds
        let seconds = secs + mins
        self.duration = Double(seconds)
    }
    
    func startTimerButt(mins: Int, secs: Int) {
        if mins != 0 || secs != 0 {
            setTimer(minutes: mins, seconds: secs)
            enableTimerMethod()
            enableTimerLeftMethod()
        }
    }
    
    func enableTimerLeftMethod() {
        timerActive = true
        timerLeft = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.durationLeft += 1
            if self.durationLeft >= self.duration { self.stopTimerButton() }
        }
    }
    
    func enableTimerMethod() {
        timerActive = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.duration -= 1
            if self.duration <= 0 { self.stopTimerButton() }
            
        }
    }
    
    func timerActionButton() {
        if timerActive {
            timerActive = false
            timer.invalidate()
            timerLeft.invalidate()
        } else { enableTimerMethod()
            enableTimerLeftMethod()
        }
    }
    
    func stopTimerButton(isSave: Bool = false) {
        timerActive = false
        timer.invalidate()
        timerLeft.invalidate()
        duration = 0
        durationLeft = 0
        if(!isSave){
            NotificationCenter.default.post(name: Notification.Name("endTime"), object: nil)
        }
    }
}
