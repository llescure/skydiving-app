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
            NavigationStack {
                Text("Dropzone : \(dropzoneSelected)")
                    .navigationTitle(dropzoneSelected)
                    Text(String(weather.tempMax!))
                    Text(String(weather.weatherDescription!))
            }
        }
        // Used to reset the value o dropzone to empty
        .onDisappear{
            dropzoneSelected = ""
        }
    }
}
