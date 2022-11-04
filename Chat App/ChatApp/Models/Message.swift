//
//  Message.swift
//  ChatApp
//
//  Created by Aayush kumar on 28/06/22.
//

import Foundation

struct Message: Identifiable, Codable
{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
