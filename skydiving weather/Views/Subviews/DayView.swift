//
//  DayView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 03/01/2023.
//

import SwiftUI

struct DayView: View {
    @State private var isShowingKeyMetrics: Bool = false
    let dayInfo: WeatherInfoByDay
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: dayInfo.weatherSystemImage)
                    .frame(width: 28)
                Text(dayInfo.date)
            }
            .accessibilityAddTraits(.isHeader)
            .accessibilityElement(children: .combine)
            .font(.title3)
            .bold()
            .padding(.leading, -30)
            Spacer()
            if (isShowingKeyMetrics) {
                KeyMetricsView(dayInfo: dayInfo)
            }
            else {
                DescriptionView(dayInfo: dayInfo)
            }
        }
        .onTapGesture {
            isShowingKeyMetrics = !isShowingKeyMetrics
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
