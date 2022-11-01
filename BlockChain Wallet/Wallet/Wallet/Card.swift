//
//  Card.swift
//  Wallet
//
//  Created by Aayush kumar on 16/10/22.
//

import Foundation
import SwiftUI

struct Card: Hashable {
    let income: Int
    let expenses: Int
    var balance: Int {
        income - expenses
    }
    let cardNumber: String
    let imageName: String
    var isSelected = false
    var backgroundColor: Color {
        isSelected ? Color.blue : Color.red
            .opacity(0.5)
    }
    var TextColor: Color {
        isSelected ? .white : .black
    }
    
    var incomePercentage: Int {
     Int(Double(balance ) / Double(income) * 100)
    }
}
