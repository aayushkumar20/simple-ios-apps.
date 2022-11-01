//
//  HorizontalProgressView.swift
//  Wallet
//
//  Created by Aayush kumar on 17/10/22.
//

import SwiftUI

struct HorizontalProgressView: View {
    @Binding var percentage: Int
    @EnvironmentObject var wallet: Wallet
    var body: some View
    {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.red)
                    .frame(height: 20)
                    .opacity(0.6)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(width: proxy.size.width * CGFloat(percentage)/100, height: 20)
                    .opacity(0.6)
            }
        }
    }
}

struct HorizontalProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressView(percentage: .constant(50))
    }
}
