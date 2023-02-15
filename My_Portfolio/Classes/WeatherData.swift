//
//  WeatherData.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-12-22.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
//    var date: Date = .now
}

struct Main:Decodable{
    var temp: Double 
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
    let feels_like: Double
}

struct Weather: Decodable {
    let description: String
    let main: String
    
    var icon: String {
        switch main {
        case "Clouds":
            return "cloud.sun.fill"
        case "Clear":
            return "sun.max.fill"
        case "light rain", "Rain", "few clouds":
            print("icon is cloud.rain")
            return "cloud.rain.fill"
        case "Mist", "Fog":
            return "cloud.fog.fill"
        default:
            return "ladybug"
        }
    }
    
    var background: String {
        switch main {
        case "Clouds", "Rain":
            return "cloudy_day_3"
        case "Clear":
            return "sunny_day"
        case "Fog":
            return "cloudy_day_3"
        default:
            return "Color3"
        }
    }

}

