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
}

struct Main:Decodable{
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let humidity: Int
    let feels_like: Double
}

struct Weather: Decodable {
    let description: String
    let main: String

}

