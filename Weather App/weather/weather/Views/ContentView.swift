//
//  ContentView.swift
//  weather
//
//  Created by Aayush kumar on 20/12/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager=LocationManager()
    var weatherManager = WeatherManager()
    @State var weather:ResponseBody?
    
    var body: some View {
        VStack{
            if let location=locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                } else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error while getting weather data")
                            }
                        }
                }
            } else{
                if locationManager.isLoading{
                    LoadingView()
                }else{
                    Welcome()
                        .environmentObject(locationManager)

                }
            }
        }
        .background(Color(hue: 0.511, saturation: 0.71, brightness: 0.459))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
