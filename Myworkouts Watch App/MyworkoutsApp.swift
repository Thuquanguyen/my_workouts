//
//  MyworkoutsApp.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 11/06/2023.
//

import SwiftUI

@main
struct Myworkouts_Watch_AppApp: App {
    @StateObject private var workoutManager = WorkoutManager()
    @StateObject private var counwDownVM = CountDownViewModel()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }.sheet(isPresented: $workoutManager.showingSummaryView) {
                TrainingView()
            }
            .environmentObject(workoutManager)
            .environmentObject(counwDownVM)
        }
    }
}
