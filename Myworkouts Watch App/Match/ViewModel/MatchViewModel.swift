//
//  MatchViewModel.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 14/06/2023.
//

import Foundation
import Foundation
import SwiftUI



class MatchViewModel: ObservableObject, Identifiable{
    var backgroundColor: Color = Color(hex: 0x09E099)
    
    var metrics: [MetricModel] = [
        MetricModel(id: 0,title: "Duration", value: "80:59", unit: ""),
        MetricModel(id: 1,title: "Total Distance", value: "9,8", unit: "km"),
        MetricModel(id: 2,title: "Max Speed", value: "31,4", unit: "km/h"),
        MetricModel(id: 3,title: "Average Speed", value: "12,4", unit: "km/h"),
        MetricModel(id: 4,title: "Sprints", value: "18", unit: ""),
        MetricModel(id: 5,title: "Sprints Distance", value: "480", unit: "m"),
        MetricModel(id: 6,title: "Max Heartrate", value: "191", unit: "BPM"),
        MetricModel(id: 7,title: "Average Heartrate", value: "134", unit: "BPM"),
        MetricModel(id: 8,title: "Time in HR Zone 4-5", value: "03:41", unit: ""),
        MetricModel(id: 9,title: "VO-2", value: "61", unit: "ml/kg/min"),
        MetricModel(id: 10,title: "Calories", value: "1 500", unit: "kcal"),
    ]
}
