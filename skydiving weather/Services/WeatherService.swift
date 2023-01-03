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
            // In that case we will get the data for the day
            if (hourFromDate == 12) {
                let dayFromDate = Calendar.current.component(.day, from: convertedDate!)
                let currentDay = Calendar.current.component(.day, from: currentDate)
                let difference = dayFromDate - currentDay
                
                // Get the day of the week
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
    
    func convertDescriptionInSystemImage(description: String)->String {
        switch description {
        case "Clear":
            return "sun.max.fill"
        case "Clouds":
            return "cloud.fill"
        case "Rain":
            return "cloud.rain.fill"
        case "Snow":
            return "cloud.snow.fill"
        case "Mist":
            return "cloud.fog.fill"
        default:
            return "cloud.bolt.fill"
        }
    }
    
    func getColor(temperature: Double, weatherType: String, visibility: Double, windSpeed: Double)->String {
        if (weatherType == "Clear" && visibility >= 3000 && windSpeed * 3.6 < 35) {
            return "okGreen"
        }
        else if (weatherType == "Rain" || weatherType == "Snow" || weatherType == "Thunderstorm") {
            return "impossibleRed"
        }
        return "mediumOrange"
    }
    
    func getDescription(temperature: Double, weatherType: String, visibility: Double, windSpeed: Double)->String {
        if (weatherType == "Clear" && visibility >= 3000 && windSpeed * 3.6 < 35 && temperature >= 10) {
            return "The weather is ideal for skydiving. The wind is less than 35 km/h. The sky is clear with a visibility higher than 3km, without rain."
        }
        else if (weatherType == "Clear" && visibility >= 3000 && windSpeed * 3.6 < 35 && temperature < 10) {
            return "You can go skydiving but it will be cold! Don't forget that we lose 20 degrees between the ground temperature and the temperature at 4000 meters. Be sure to check that your dropzone is open. Most of them are closed during winter"
        }
        else if (weatherType == "Rain") {
            return "Rain is expected all day, so there is very little chance of skydiving."
        }
        else if (weatherType == "Thunderstorm") {
            return "Thunderstorms are forecast for the day, creating unstable weather conditions. There is very little chance of skydiving."
        }
        else if (weatherType == "Snow") {
            return "Snow is forecast for the day, even if there is some sunshine, are you sure you want to try the -20°C up there ?"
        }
        else if (visibility < 3000) {
            return "The visibility is not good. But there may be some chance to skydive if the weather clears. Keep checking the weather forecast"
        }
        else if (windSpeed * 3.6 < 35) {
            return "It's too windy to go skydiving right now. Keep checking the weather forecast"
        }
        return "It's cloudy all day but if the clouds are high enough, skydiving might be possible!"
    }
    
    
    func fetchWeatherData(latitude: String, longitude: String, callback: @escaping ([WeatherInfoByDay]?, WebServiceControllerError?) -> Void) {
        
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
                        var weatherInfoByDay: [WeatherInfoByDay] = []
                        
                        for i in 0...weatherDataSize {
                            // Create an array of data dated at 12 o'clock of the 5 following days
                            if let weekDay = getWeekDay(date: weatherData.list[i].dt_txt)
                            {
                                weatherInfoByDay.append(WeatherInfoByDay(temperature: convertTemperature(temperature: weatherData.list[i].main.temp!),
                                                                         weatherSystemImage: convertDescriptionInSystemImage(description: weatherData.list[i].weather.first!.main!),
                                                                         date: weekDay,
                                                                         windSpeed: convertWindSpeed(speed: weatherData.list[i].wind.speed!),
                                                                         windOrientation: convertWindDegree(degree: weatherData.list[i].wind.deg!),
                                                                         visibility: convertVisibility(visibility: weatherData.list[i].visibility!),
                                                                         color: getColor(temperature: weatherData.list[i].main.temp!,
                                                                                         weatherType: weatherData.list[i].weather.first!.main!,
                                                                                         visibility: weatherData.list[i].visibility!,
                                                                                         windSpeed: weatherData.list[i].wind.speed!),
                                                                         description: getDescription(temperature: weatherData.list[i].main.temp!,
                                                                                                     weatherType: weatherData.list[i].weather.first!.main!,
                                                                                                     visibility: weatherData.list[i].visibility!,
                                                                                                     windSpeed: weatherData.list[i].wind.speed!)
                                                                        ))
                            }
                        }
                        callback(weatherInfoByDay, nil)
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
