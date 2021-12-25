//
//  TriviaView.swift
//  TriviaGame
//
//  Created by Aayush kumar on 25/12/21.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd{
            VStack(spacing: 20){
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Thank you for playing this game")
                
                Text("Your Score \(triviaManager.score) out of \(triviaManager.length)" )
                
                Button {
                    Task.init {
                        await triviaManager.fetchTrivia()
                    }
                }label: {
                    PrimaryButton(text: "Wanna Play again??")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 230, green: 221, blue: 196))
        }else{
            QuestionView()
                .environmentObject(triviaManager)
        }
        QuestionView()
            .environmentObject(triviaManager)
        
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
