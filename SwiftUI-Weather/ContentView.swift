//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Konstantin Doloz on 25.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(city: "Cupertino, CA")
             
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 79)
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 60)
                    WeatherDayView(dayOfWeek: "THU", imageName: "snow", temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 76)
                    WeatherDayView(dayOfWeek: "SAD", imageName: "cloud.snow.fill", temperature: 40)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time you beb",
                                      textColor: isNight ? .white : .blue,
                                      backgroundColor: isNight ? Color(.systemGray2) : .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Text(dayOfWeek)
                .fontWeight(.medium)
                .font(.system(size:15))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor )
                .resizable()
                .foregroundColor(.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .semibold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? Color("darkBlue") : .blue, isNight ? .black : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

