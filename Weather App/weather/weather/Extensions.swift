//
//  Extensions.swift
//  weather
//
//  Created by Aayush kumar on 21/12/21.
//

import Foundation
import UIKit
import SwiftUI

extension Double{
    func roundDouble() -> String{
        return String(format:"%.0f",self)
    }
}

extension View{
    func cornerRadius(radius:CGFloat,corners:UIRectCorner)->some View{
        clipShape(RoundedCorner(radius:radius,corners:corners))
    }
}

struct RoundedCorner:Shape{
    var radius:CGFloat = .infinity
    var corners:UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
