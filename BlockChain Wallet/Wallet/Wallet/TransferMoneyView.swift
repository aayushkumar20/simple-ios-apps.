//
//  TransferMoneyView.swift
//  Wallet
//
//  Created by Aayush kumar on 18/10/22.
//

import SwiftUI

struct TransferMoneyView: View {
    var headerView: some View {
        HStack{
            Text("Transfer to other address")
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
        }
    }
    var body: some View {
        VStack {
            headerView
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(0..<0) { num in
                        Image("user\(num)")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .opacity(0.2)
                    }
                    Button{}
                label: {
                    Image(systemName: "plus")
                        .imageScale(.small)
                        .foregroundColor(.black)
                }
                .frame(width: 50, height: 50)
                .background(Color.gray)
                .cornerRadius(5)
                }
            }
        }
    }
}

struct TransferMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        TransferMoneyView()
    }
}
