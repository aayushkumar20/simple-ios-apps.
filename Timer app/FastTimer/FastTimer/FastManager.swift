//
//  FastManager.swift
//  FastTimer
//
//  Created by Aayush kumar on 11/03/22.
//

import Foundation

enum FastState{
    case notStarted
    case fast
    case feeding
}
enum FastPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    var fastPeriod: Double {
        switch self {
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
}
class FastManager: ObservableObject { 
    @Published private(set) var fastState: FastState = .notStarted
    @Published private(set) var fastPlan: FastPlan = .intermediate
    @Published private(set) var startTime: Date{
        didSet{
            print("startTime",startTime.formatted(.dateTime.month().day().hour().minute().second()))
            if fastState == .fast{
                endTime = startTime.addingTimeInterval(fastingTime)
            }else{
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
    }
    @Published private(set) var endTime: Date{
        didSet{
            print("endTime",endTime.formatted(.dateTime.month().day().hour().minute().second()))
        }
    }
    @Published private(set) var elapsed: Bool = false
    @Published private(set) var elapsedTime: Double = 0.0
    @Published private(set) var Progress: Double = 0.0
    var fastingTime: Double{
        return fastPlan.fastPeriod * 60 * 60
    }
    var feedingTime: Double{
        return (24 - fastPlan.fastPeriod) * 60 * 60
    }
    init(){
        let calender = Calendar.current
       /* var components = calender.dateComponents([.year, .month, .day, .hour], from: Date())
        components.hour = 20
        print(components)
        let scheduledTime = calender.date(from: components) ?? Date.now
        print("ScheduledTime",scheduledTime.formatted(.dateTime.month().day().hour().minute().second()))
      */
        let components = DateComponents(hour: 20)
        
        let scheduledTime = calender.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        print("ScheduledTime",scheduledTime.formatted(.dateTime.month().day().hour().minute().second()))
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastPlan.intermediate.fastPeriod * 60 * 60)
    }
    func toggleFastState() {
        fastState = fastState == .fast ? .feeding : .fast
        startTime = Date()
        elapsedTime = 0.0
    }
    func track(){
        guard fastState != .notStarted else {
            return
        }
        print("now",Date().formatted(.dateTime.month().day().hour().minute().second()))
        if endTime >= Date(){
            print("not elapsed")
            elapsed = false
        }
        else {
            print("elapsed")
            elapsed = true
        }
        elapsedTime += 1
        print("elapsedTime", elapsedTime)
        let totalTime = fastState == .fast ? fastingTime : feedingTime
        Progress = (elapsedTime / totalTime * 100).rounded() / 100
        print("progress",Progress)
    }
}
