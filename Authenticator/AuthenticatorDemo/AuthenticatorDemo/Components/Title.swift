//
//  Title.swift
//  AuthenticatorDemo
//
//  Created by Aayush kumar on 06/08/22.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Implementing FaceID and TouchID in swift.")
            .bold()
            .font(.title3)
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.black,.green], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}
