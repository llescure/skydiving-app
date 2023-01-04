//
//  DescriptionView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 03/01/2023.
//

import SwiftUI

struct DescriptionView: View {
    let dayInfo: WeatherInfoByDay

    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            Text("\(dayInfo.description)")
                .font(.subheadline)
            Label("Tap for detail", systemImage: "arrow.right")
                .accessibilityLabel("Temperature in Celsius")
                .accessibilityValue("\(dayInfo.temperature) degrees")
                .labelStyle(.buttonIcon)
                .font(.caption2)
        }
        .frame(height: 130)
    }
}

