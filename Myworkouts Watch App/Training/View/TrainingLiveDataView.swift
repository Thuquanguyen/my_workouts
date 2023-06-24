//
//  TrainingLiveDataView.swift
//  Myworkouts Watch App
//
//  Created by MacBook on 12/06/2023.
//

import Foundation
import HealthKit
import SwiftUI
import WatchKit

struct TrainingLiveDataView<Model,VM>: View where Model: TrainingViewModel,VM: WorkoutManager {
    @EnvironmentObject var workoutManager: VM
    @ObservedObject var viewModel: Model
    
    var body: some View {
        TimelineView(MetricsTimelineSchedule(from: workoutManager.builder?.startDate ?? Date(),
                                             isPaused: workoutManager.session?.state == .paused)) { context in
            ScrollView{
                ElapsedTimeView(elapsedTime: workoutManager.builder?.elapsedTime(at: context.date) ?? 0, showSubseconds: context.cadence == .live).cornerRadius(8)
                ItemLiveData(title: "Max Speed", subTitle: "\(workoutManager.maxSpeed) km/h").cornerRadius(8)
                ItemLiveData(title: "Avg Speed", subTitle: "\(workoutManager.avgSpeed) km/h").cornerRadius(8)
                ItemLiveData(title: "Total Distance", subTitle: "\(workoutManager.distance) km").cornerRadius(8)
                ItemLiveData(title: "Sprints", subTitle: "\(workoutManager.sprints)".uppercased()).cornerRadius(8)
                ItemLiveData(title: "Sprints Distance", subTitle: "\(workoutManager.sprintsDistance) m").cornerRadius(8)
                ItemLiveData(title: "Max Heartrate", subTitle: "\(workoutManager.maxHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")".uppercased()).cornerRadius(8)
                ItemLiveData(title: "Average Heartrate", subTitle: "\(workoutManager.averageHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm"))".uppercased()).cornerRadius(8)
                Group{
                    ItemLiveData(title: "Calories", subTitle: "\(workoutManager.calories) kcal").cornerRadius(8)
                    ItemLiveData(title: "VO-2", subTitle: "\(workoutManager.VO2) ml/kg/min").cornerRadius(8)
                    ItemLiveData(title: "Min Pulse", subTitle: "\(workoutManager.minPulse) FT".uppercased()).cornerRadius(8)
                    ItemLiveData(title: "Max Pulse", subTitle: "\(workoutManager.maxPulse) FT".uppercased()).cornerRadius(8)
                }
            }
            .padding(.zero)
        }
    }
}

struct TrainingLiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingLiveDataView(viewModel: TrainingViewModel()).environmentObject(WorkoutManager())
    }
}

private struct MetricsTimelineSchedule: TimelineSchedule {
    var startDate: Date
    var isPaused: Bool

    init(from startDate: Date, isPaused: Bool) {
        self.startDate = startDate
        self.isPaused = isPaused
    }

    func entries(from startDate: Date, mode: TimelineScheduleMode) -> AnyIterator<Date> {
        var baseSchedule = PeriodicTimelineSchedule(from: self.startDate,
                                                    by: (mode == .lowFrequency ? 1.0 : 1.0 / 30.0))
            .entries(from: startDate, mode: mode)
        
        return AnyIterator<Date> {
            guard !isPaused else { return nil }
            return baseSchedule.next()
        }
    }
}
