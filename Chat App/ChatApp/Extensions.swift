//
//  Extensions.swift
//  ChatApp
//
//  Created by Aayush kumar on 28/06/22.
//

import Foundation
import SwiftUI

// extensions for adding rounded corner to specific corners
extension View {
    func cornerRadius(_ radius:CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
// Custom RoundedCorner shape used for extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
