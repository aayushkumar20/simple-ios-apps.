//
//  HeaderView.swift
//  Wallet
//
//  Created by Aayush kumar on 16/10/22.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hi! Welcome")
                    .font(.callout)
                    .foregroundColor(Color(.systemGray3))
                Text("Aayush")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
            Image("me")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
