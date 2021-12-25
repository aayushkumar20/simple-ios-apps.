//
//  Answer.swift
//  TriviaGame
//
//  Created by Aayush kumar on 25/12/21.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
