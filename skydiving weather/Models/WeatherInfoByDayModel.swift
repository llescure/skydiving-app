//
//  WeatherInfoByDayModel.swift
//  skydiving weather
//
//  Created by Léa Lescure on 03/01/2023.
//

import Foundation

struct WeatherInfoByDay: Identifiable, Codable {
    let id: UUID
    var temperature: Double
    var weatherSystemImage: String
    var date: String
    var windSpeed: Double
    var windOrientation: String
    var visibility: Double
    var color: String
    var description: String
    
    init(id: UUID = UUID(), temperature: Double, weatherSystemImage: String, date: String, windSpeed: Double, windOrientation: String, visibility: Double, color: String, description: String) {
        self.id = id
        self.temperature = temperature
        self.weatherSystemImage = weatherSystemImage
        self.date = date
        self.windSpeed = windSpeed
        self.windOrientation = windOrientation
        self.visibility = visibility
        self.color = color
        self.description = description
    }
}
