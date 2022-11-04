//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Aayush kumar on 28/06/22.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
