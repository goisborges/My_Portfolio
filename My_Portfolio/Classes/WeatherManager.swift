//
//  WeatherManager.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-12-22.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherData)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?

    var cityName: String = ""
    
    //api key
    let apiKey: String = "9705b25329117ad8563d6f175906a57f"
    
    //api call url
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?APPID=9705b25329117ad8563d6f175906a57f&units=metric"
    
    
    
    func fetchWeather(cityName: String) {
        // using NSURL components
        // create URL using NSURL components to solve space issues on string
        let uc = NSURLComponents(string: "https://api.openweathermap.org/data/2.5/weather?APPID=9705b25329117ad8563d6f175906a57f&units=metric")!
        uc.queryItems = [
            URLQueryItem(name: "q", value: cityName)
        ]
        let finalURL = uc.url!.absoluteString
        print("This is the final URL: \(finalURL)")
        performRequest(urlString: finalURL)
        
//        let urlString = "\(weatherURL)&q=\(cityName)"
//        print(urlString)
//        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //1. Create a URL
        if let url = URL(string: urlString){
            
            //2. Create a URL Session
            let session = URLSession(configuration: .default)
            
            //3 give the sssion a task
            let task = session.dataTask(with: url) { (data,response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(weather: weather)
                        print("sending object to delegate")
                    }
                }
            }
                
                //4. Start the task
                task.resume()
            
        }
    }
    
    
    
    func parseJSON(weatherData: Data) -> WeatherData? {
        var decodedData: WeatherData = WeatherData(name: "default", main: Main(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0, feels_like: 0.0), weather: [Weather(description: "default", main: "default")])
        let decoder = JSONDecoder()
        do{
            decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            return decodedData
        }
        catch {
            print("Error is: \(error)")
            return nil
        }

       
    }
}

    

