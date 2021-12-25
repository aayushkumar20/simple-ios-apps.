//
//  ContentView.swift
//  TriviaGame
//
//  Created by Aayush kumar on 24/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var triviaManager = TriviaManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40){
                VStack(spacing: 20){
                Text("Basic Quiz Game")
                        .lilacTitle()
                
                Text("Let's check your knowledge")
                    .font(.title)
                    .fontWeight(.thin)
                    .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                }label: {
                    PrimaryButton(text: "Let's Go! ->")
                }
        
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 230, green: 221, blue: 196))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
