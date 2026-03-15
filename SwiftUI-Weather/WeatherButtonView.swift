//
//  WeatherButtonView.swift
//  SwiftUI-Weather
//
//  Created by Konstantin Doloz on 25.10.2023.
//

import SwiftUI

struct WeatherButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .semibold, design: .default))
            .cornerRadius(10)
    }
}

struct WeatherButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButtonView(title: "Test", textColor: .blue, backgroundColor: .white)
    }
}
