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

extension Array {
    public mutating func append(_ newElement: Element?) {
        if let element = newElement {
            self.append(element)
        }
    }
}

public struct WeatherService {
    private let apiKey: String = "3cd9eaaf200ce8b8c0ad58e98b1c9b33"
    private let baseUrl: String = "https://api.openweathermap.org/data/2.5/forecast"

    func getWeekDay(date: String?)-> String?{
        if let strDate = date {
            let dateFormatter = DateFormatter()
            let currentDate = Date()
            
            dateFormatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm':'ss"
            let convertedDate = dateFormatter.date(from: strDate)
           
            let hourFromDate = Calendar.current.component(.hour, from: convertedDate!)
            
            // Check if the current data is set for 12 o'clock
            if (hourFromDate == 12) {
                let dayFromDate = Calendar.current.component(.day, from: convertedDate!)
                let currentDay = Calendar.current.component(.day, from: currentDate)
                let difference = dayFromDate - currentDay
                
                dateFormatter.dateFormat = "EEEE"
                let weekDay = dateFormatter.string(from: convertedDate!)
                
                switch difference {
                case 0:
                    return "Today"
                case 1:
                    return "Tomorrow"
                default:
                    return weekDay
                }
            }
            return nil
        }
        return nil
     }
    
    func convertVisibility(visibility: Double)->Double {
        return (round(visibility / 1000))
    }
    
    func convertWindSpeed(speed: Double)->Double {
        return (round(speed * 3.6))
    }
    
    func convertTemperature(temperature: Double)->Double {
        return (round(temperature))
    }
    
    func convertWindDegree(degree: Double)->String {
        switch degree {
        case 0...45:
            return "North"
        case 45...90:
            return "North-East"
        case 90...135:
            return "East"
        case 135...180:
            return "South-East"
        case 180...225:
            return "South"
        case 225...270:
            return "South-West"
        case 270...315:
            return "West"
        default:
            return "North-West"
        }
    }
    
    func fetchWeatherData(latitude: String, longitude: String, callback: @escaping ((temperature: [Double], visibility: [Double], windSpeed: [Double], windOrientation: [String], weatherDescription: [String], date: [String])?, WebServiceControllerError?) -> Void) {
        
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
                        let weatherDataSize = weatherData.list.count - 1
                        var weatherDescription: [String] = []
                        var date: [String] = []
                        var temperature: [Double] = []
                        var visibility: [Double] = []
                        var windSpeed: [Double] = []
                        var windOrientation: [String] = []
                        
                        for i in 0...weatherDataSize {
                            // Create an array of data dated at 12 o'clock of the 5 following days
                            if let weekDay = getWeekDay(date: weatherData.list[i].dt_txt) {
                                weatherDescription.append(weatherData.list[i].weather.first?.main)
                                date.append(weekDay)
                                temperature.append(convertTemperature(temperature: weatherData.list[i].main.temp!))
                                visibility.append(convertVisibility(visibility: weatherData.list[i].visibility!))
                                windSpeed.append(convertWindSpeed(speed: weatherData.list[i].wind.speed!))
                                windOrientation.append(convertWindDegree(degree: weatherData.list[i].wind.deg!))
                            }
                        }
                        callback((temperature: temperature, visibility: visibility, windSpeed: windSpeed, windOrientation: windOrientation, weatherDescription: weatherDescription, date: date), nil)
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
