//
//  LoadingView.swift
//  weather
//
//  Created by Aayush kumar on 21/12/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
        .progressViewStyle(CircularProgressViewStyle(tint:.white))
        .frame(maxWidth:.infinity,maxHeight:.infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
