//
//  KeyMetricsView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 03/01/2023.
//

import SwiftUI

struct KeyMetricsView: View {
    let dayInfo: WeatherInfoByDay
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 6) {
                Label("\(String(format:"%.0f", dayInfo.windSpeed)) km/h", systemImage: "wind")
                    .accessibilityLabel("Speed of wind")
                    .accessibilityValue("\(dayInfo.windSpeed) km/h")
                Label("\(String(format:"%.0f", dayInfo.temperature))°C", systemImage: "thermometer.medium")
                    .accessibilityLabel("Temperature in Celsius")
                    .accessibilityValue("\(dayInfo.temperature) degrees")
            }
            Spacer()
                .frame(width: 60)
            VStack (alignment: .leading, spacing: 6) {
                Label("\(dayInfo.windOrientation)", systemImage: "paperplane.circle")
                    .accessibilityLabel("Wind orientation")
                    .accessibilityValue("\(dayInfo.windOrientation)")
                Label("\(String(format:"%.0f", dayInfo.visibility)) km", systemImage: "binoculars")
                    .accessibilityLabel("Visibility")
                    .accessibilityValue("\(dayInfo.visibility) km")
            }
        }
        .frame(height: 80)
        .font(.subheadline)
    }
}
