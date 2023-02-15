//
//  WeatherView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI

//var weatherManager = WeatherManager()

struct WeatherView: View {

    @State private var weathers = WeatherData(name: "", main: Main(temp: 0.0, temp_min: 0.0, temp_max: 0.0, humidity: 0, feels_like: 0.0), weather: [Weather(description: "", main: "")])
    
    @State var cityNameInput: String = "Barrie"
    
    @State var date = Date().formatted(.dateTime.day().month(.wide).year().hour().minute())
    
    var body: some View {
        NavigationView{
            
            ZStack{
                
                Image(weathers.weather[0].background)
                    .resizable()
                    .renderingMode(.original)
                    .opacity(1)
                    .cornerRadius(40)
                    .ignoresSafeArea()
                    .blur(radius: 5)
                    
                VStack{
                        HStack{
                            Text("City:")
                            TextField("enter a city name", text: $cityNameInput)
                                .task {
                                    await fetchData(city: cityNameInput)
                                }.keyboardShortcut(.return).onSubmit {
                                    Task{
                                        await fetchData(city: cityNameInput)
                                        cityNameInput = ""
                                    }
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
                            
                        }.padding(15).foregroundColor(.white)
                           
                   
                    Spacer()
                    
                    VStack{
                        Image(systemName: weathers.weather[0].icon).font(.system(size: 90)).padding(5)
                        VStack{
                            Text(weathers.name).font(.largeTitle)
                            Text(weathers.weather[0].description).font(.callout).padding(.bottom)
                            Text("Temperature: \(String(format: "%.0f", weathers.main.temp))").font(.headline)
                            Text("Max temp: \(String(format: "%.0f", weathers.main.temp_max))")
                            Text("Min temp: \(String(format: "%.0f", weathers.main.temp_min))")
                        }.padding(30)
                    }
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .padding(5)
                    .background(Color.white.opacity(0.6).cornerRadius(20))
                    
                    Spacer()
                    
                    Text("\(date)").foregroundColor(.white).font(.callout)
                    
                }.task {
                    await fetchData(city: cityNameInput)
                }
            }
  
        }.navigationTitle("Weather Now")
    }
    
    
    
    func fetchData(city: String) async{
        //retrieve the API KEY
        let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
        
        //create url
        let uc = NSURLComponents(string: "https://api.openweathermap.org/data/2.5/weather?APPID=\(String(describing: apiKey))&units=metric")!
        uc.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "APPID", value: "9705b25329117ad8563d6f175906a57f"),
            URLQueryItem(name: "units", value: "metric")
        ]
        let finalURL = uc.url!.absoluteURL
//      print(finalURL)
        
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
                print(weathers.weather[0].main)
                print( "weather main: ")
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
