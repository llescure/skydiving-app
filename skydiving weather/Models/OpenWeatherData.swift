//
//  OpenWeatherData.swift
//  skydiving weather
//
//  Created by Léa Lescure on 02/01/2023.
//

import Foundation

struct OpenMapWeatherData: Codable {
    var list: [OpenMapWeatherList]
}

struct OpenMapWeatherList: Codable {
    var weather: [OpenMapWeatherWeather]
    var main: OpenMapWeatherMain
    var wind: OpenMapWeatherWind
    var visibility: Double?
    var dt_txt: String?
}

struct OpenMapWeatherWeather: Codable {
    var id: Int?
    var main: String?
    var description: String?
}

struct OpenMapWeatherMain: Codable {
    var temp: Double?
}

struct OpenMapWeatherWind: Codable {
    var speed: Double?
    var deg: Double?
}
