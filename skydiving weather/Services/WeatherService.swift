//
//  WeatherService.swift
//  skydiving weather
//
//  Created by Léa Lescure on 01/01/2023.
//

import Foundation

public enum WebServiceControllerError: Error {
    case invalidUrl(String)
    case invalidPayload(URL)
    case forwared(Error)

}

public struct WeatherService {
    private let apiKey: String = "3cd9eaaf200ce8b8c0ad58e98b1c9b33"
    private let baseUrl: String = "https://api.openweathermap.org/data/2.5/forecast"

    func fetchWeatherData(latitude: String, longitude: String, callback: @escaping ((temperature: Double, visibility: Double, windSpeed: Double, windDegree: Double, weatherDescription: String)?, WebServiceControllerError?) -> Void) {
        
        let possibleUrl = "\(baseUrl)?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
        
        if let url = URL(string: possibleUrl) {

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    callback(nil, WebServiceControllerError.forwared(error!))
                    return
                }
                
                if let dataFromWeather = data, let _ = response  {
                    let decoder = JSONDecoder()

                    do {
                        let weatherData = try decoder.decode(OpenMapWeatherData.self, from: dataFromWeather)

                        guard let weatherDescription = weatherData.list.first?.weather.first?.main,
                              let temperature = weatherData.list.first?.main.temp,
                              let visibility = weatherData.list.first?.visibility,
                              let windSpeed = weatherData.list.first?.wind.speed,
                              let windDegree = weatherData.list.first?.wind.deg
                        else {
                                  print("Unvalid data")
                                  callback(nil, WebServiceControllerError.invalidPayload(url))
                                  return
                              }
                        callback((temperature: temperature, visibility: visibility, windSpeed: windSpeed, windDegree: windDegree, weatherDescription: weatherDescription), nil)
                    }
                    catch let error {
                        callback(nil, WebServiceControllerError.forwared(error))
                    }
                } else {
                    callback(nil, WebServiceControllerError.invalidPayload(url))
                }
            }.resume()
        } else {
            callback(nil, WebServiceControllerError.invalidUrl(possibleUrl))
        }
    }
}
