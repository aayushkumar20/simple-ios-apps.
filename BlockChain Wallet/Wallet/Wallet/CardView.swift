//
//  CardView.swift
//  Wallet
//
//  Created by Aayush kumar on 16/10/22.
//

import SwiftUI

struct CardView: View {
    let card: Card
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(card.imageName)
                    .resizable()
                    .frame(width: 55, height: 75)
                    .opacity(0.65)
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            Spacer()
            Text("\(card.balance)")
                .foregroundColor(card.TextColor)
                .fontWeight(.bold)
                Spacer()
            Text(card.cardNumber)
                .foregroundColor(card.TextColor)
                .font(.callout)
        }
        .padding(.vertical, 10)
        .background(card.backgroundColor)
        .cornerRadius(10)
        .frame(width: 110, height: 150)
        .padding(0.5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
            .environmentObject(Wallet())
    }
}
