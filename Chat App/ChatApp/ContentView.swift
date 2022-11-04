//
//  ContentView.swift
//  ChatApp
//
//  Created by Aayush kumar on 28/06/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView{
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messagesManager.lastMessageId) { id in
                    withAnimation{
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                    }
                }
            }
            .background(Color("Blue"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
