//
//  WeatherResultView.swift
//  skydiving weather
//
//  Created by Léa Lescure on 23/12/2022.
//

import SwiftUI

struct WeatherResultView: View {
    @Binding var dropzoneSelected: String
    var weather: WeatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            Text(dropzoneSelected)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .accessibilityAddTraits(.isHeader)
            NavigationStack {
                List {
                    ForEach(weather.weatherInfoByDay) { dayInfo in
                        DayView(dayInfo: dayInfo)
                            .listRowBackground(Color(dayInfo.color))
                            .listRowSeparatorTint(.white)
                    }
                }
            }
            
        }
        // Used to reset the value of dropzone to empty
        .onDisappear{
            dropzoneSelected = ""
        }
    }
}
