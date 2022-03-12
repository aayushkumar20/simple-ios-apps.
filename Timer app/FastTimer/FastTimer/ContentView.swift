//
//  ContentView.swift
//  FastTimer
//
//  Created by Aayush kumar on 11/03/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fastManager = FastManager()
    var title:String{
        switch fastManager.fastState{
        case .notStarted:
            return "Let's get started"
        case .fast:
            return "You're in fast"
        case .feeding:
            return "Enjoy your food"
        }
    }
    var body: some View {
        ZStack{
            //Mark: Background
            Color(#colorLiteral(red: 0.1540534496, green: 0.1464503407, blue: 0.2749760747, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    var content: some View{
        ZStack {
            VStack(spacing: 40)
            {
                //Title
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)))
                //Fast Plan
                Text(fastManager.fastPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal,24)
                    .padding(.vertical,8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                Spacer()
            }
            .padding()
            VStack(spacing:40){
                //progress ring.
                ProgressRing()
                    .environmentObject(fastManager)
                HStack(spacing: 60){
                    //Start Time.
                    VStack(spacing: 5){
                        Text(fastManager.fastState == .notStarted ? "Start":"Started")
                            .opacity(0.7)
                        Text(fastManager.startTime,format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    //End Time.
                    VStack(spacing: 5){
                        Text(fastManager.fastState == .notStarted ? "end":"ends")
                            .opacity(0.7)
                        Text(fastManager.endTime.addingTimeInterval(16),format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                //Button.
                Button{
                    fastManager.toggleFastState()
                }
            label: {
                Text(fastManager.fastState == .fast ? "End Fast" : "Start Fast")
                            .fontWeight(.semibold)
                            .padding(.horizontal,24)
                            .padding(.vertical,8)
                            .background(.thinMaterial)
                            .font(.title2)
                .cornerRadius(20)
            }
            }
            .padding()
            .foregroundColor(.white)
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
