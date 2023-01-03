//
//  DayView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 03/01/2023.
//

import SwiftUI

struct DayView: View {
    let dayInfo: WeatherInfoByDay
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: dayInfo.weatherSystemImage)
                    .frame(width: 28)
                Text(dayInfo.date)
            }
            .accessibilityAddTraits(.isHeader)
            .font(.headline)
            .bold()
            .padding(.leading, -30)
            Spacer()
            HStack {
                VStack (alignment: .leading, spacing: 6) {
                    Label("\(String(format:"%.0f", dayInfo.windSpeed)) km/h", systemImage: "wind")
                        .accessibilityLabel("\(dayInfo.windSpeed) km/h")
                    Label("\(String(format:"%.0f", dayInfo.temperature))°C", systemImage: "thermometer.medium")
                        .accessibilityLabel("\(dayInfo.temperature) degrees")
                }
                .font(.caption)
                Spacer()
                    .frame(width: 60)
                VStack (alignment: .leading, spacing: 6) {
                    Label("\(dayInfo.windOrientation)", systemImage: "paperplane.circle")
                        .accessibilityLabel("\(dayInfo.windOrientation)")
                    Label("\(String(format:"%.0f", dayInfo.visibility)) km", systemImage: "binoculars")
                        .accessibilityLabel("\(dayInfo.visibility) km")
                }
                .font(.caption)
            }
        }
        .padding()
        .foregroundColor(.white)
        // Used to have the stroke longer between each row
        .alignmentGuide(
            .listRowSeparatorLeading) { dimensions in
                dimensions[.leading]
            }
    }
}
