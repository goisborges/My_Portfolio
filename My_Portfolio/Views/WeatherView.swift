//
//  WeatherView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI

var weatherManager = WeatherManager()

struct WeatherView: View {

    @State private var weathers = WeatherData(name: "", main: Main(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0, feels_like: 0.0), weather: [Weather(description: "", main: "")])
    
    @State var cityNameInput: String = "Barrie"
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("City:")
                    TextField("enter a city name", text: $cityNameInput)
                        .task {
                            await fetchData(city: cityNameInput)
                        }
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            print(cityNameInput)
                            Task {
                                await fetchData(city: cityNameInput)
                                cityNameInput = ""
                            }
                        }
    
                }.padding(15)
                
                Spacer()
                VStack{
                    Text(weathers.name).font(.largeTitle)
                    Text(weathers.weather[0].description).font(.callout).padding(.bottom)
                    Text("Temperature: \(String(weathers.main.temp))").font(.headline)
                    Text("Max temp: \(String(weathers.main.temp_max))")
                    Text("Min temp: \(String(weathers.main.temp_min))")
                }
                
                Spacer()
 
            }.task {
                await fetchData(city: cityNameInput)
            }
            
        }.navigationTitle("Weather Now")
        
    }
    func fetchData(city: String) async{
        //create url
        let uc = NSURLComponents(string: "https://api.openweathermap.org/data/2.5/weather?APPID=9705b25329117ad8563d6f175906a57f&units=metric")!
        uc.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "APPID", value: "9705b25329117ad8563d6f175906a57f"),
            URLQueryItem(name: "units", value: "metric")
        ]
        let finalURL = uc.url!.absoluteURL
      print(finalURL)
        
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?APPID=9705b25329117ad8563d6f175906a57f&units=metric&q=\(city)") else {
//            print("URL DOESNOT WORK")
//            return
//        }
        
        // fetch the data
        do {
            let(data, _) = try await URLSession.shared.data(from: finalURL)
            
            // decode the data
            if let decodedResponse = try? JSONDecoder().decode(WeatherData.self, from: data) {
                weathers = decodedResponse
            }
        }
        catch{
            print("no response from API")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
