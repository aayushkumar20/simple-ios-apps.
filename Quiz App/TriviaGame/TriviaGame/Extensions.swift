//
//  Extensions.swift
//  TriviaGame
//
//  Created by Aayush kumar on 24/12/21.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View{
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
