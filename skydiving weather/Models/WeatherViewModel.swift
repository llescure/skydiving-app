//
//  WeatherModel.swift
//  skydiving weather
//
//  Created by Léa Lescure on 30/12/2022.
//

import Foundation

class WeatherViewModel: ObservableObject {
    private let weatherService: WeatherService = WeatherService()
    @Published var weatherInfoByDay: [WeatherInfoByDay] = []
    @Published var isFinishedLoading: Bool = false
    
    func fetchData(for dropzoneSelected: String) {
        let i = Dropzone.frenchDropzones.firstIndex(where: {$0.name == dropzoneSelected})
            weatherService.fetchWeatherData(latitude: String(Dropzone.frenchDropzones[i!].latitude), longitude: String(Dropzone.frenchDropzones[i!].longitude)) { weather, error in
                guard error == nil else {
                    print(error as Any)
                    return
                }
                if let retrievedWeather = weather {
                    DispatchQueue.main.async {
                        self.weatherInfoByDay = retrievedWeather
                        self.isFinishedLoading = true
                    }
                }
            }
    }
}
