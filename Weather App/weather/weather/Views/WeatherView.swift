//
//  WeatherView.swift
//  weather
//
//  Created by Aayush kumar on 21/12/21.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute().second()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName: "sun.max")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                            Text(weather.main.feels_like.roundDouble()+"°")
                                .font(.system(size: 100))
                                .fontWeight(.bold)
                                .padding()
                    }
                    Spacer()
                        .frame(height: 80)
                    AsyncImage(url: URL(string: "https://webstockreview.net/images/cityscape-clipart-building-landscape-1.png")){image in image
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .frame(width:350)
                    }
                placeholder:{
                    ProgressView()
                }
                    Spacer()
                }
                .frame(maxWidth:.infinity)
            }
            .padding()
            .frame(maxWidth:.infinity,alignment: .leading)
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer.snowflake", name: "Min temp", value: (weather.main.temp_min.roundDouble()+"°"))
                        Spacer()
                        WeatherRow(logo: "thermometer.sun.fill", name: "Max temp", value: (weather.main.temp_max.roundDouble()+"°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble()+"m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble()+"%"))
                    }
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue: 0.511, saturation: 0.71, brightness: 0.459))
                .background(.white)
                .cornerRadius(radius:20.0, corners:[.topLeft,.topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.511, saturation: 0.71, brightness: 0.459))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
