//
//  Welcome.swift
//  weather
//
//  Created by Aayush kumar on 20/12/21.
//

import SwiftUI
import CoreLocationUI

struct Welcome: View {
    @EnvironmentObject var locationManager:
    LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Hello Welcome to my App.")
                    .bold().font(.title)
                Text("Please allow us to know your current location.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
