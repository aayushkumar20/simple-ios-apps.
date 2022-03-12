//
//  ProgressRing.swift
//  FastTimer
//
//  Created by Aayush kumar on 11/03/22.
//

import SwiftUI

struct ProgressRing: View {
    @EnvironmentObject var fastManager: FastManager
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack{
            //Mark: PlaceHolder
            
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            //Mark: Colored ring
            
            Circle()
                .trim(from: 0.0, to: min(fastManager.Progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)),Color(#colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))]),center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: fastManager.Progress)
            VStack(spacing: 30){
                if fastManager.fastState == .notStarted{
                    // Upcoming fast
                    VStack(spacing:5){
                        Text("Upcoming Fast")
                            .opacity(0.7)
                        Text("\(fastManager.fastPlan.fastPeriod.formatted()) Hours")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }else{
                    // Eclapsed time
                    VStack(spacing:5){
                        Text("Time Passed (\(fastManager.Progress.formatted(.percent)))")
                            .opacity(0.7)
                        Text(fastManager.startTime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top)
                    // Remaining time
                    VStack(spacing:5){
                        if !fastManager.elapsed{
                            Text("Time Remaining (\((1-fastManager.Progress).formatted(.percent))")
                                .opacity(0.7)
                        }else{
                            Text("Extra Time")
                                .opacity(0.7)
                        }
                        Text(fastManager.endTime, style: .timer)
                            .font(.title3)
                            .fontWeight(.bold)
                    }

                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        /*.onAppear{
            fastManager.Progress = 1
        }
        */.onReceive(timer)
        { _ in fastManager.track()
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
            .environmentObject(FastManager())
    }
}
