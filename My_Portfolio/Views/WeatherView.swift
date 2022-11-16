//
//  WeatherView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var weather: WeatherNow = WeatherNow(location: Location(name: "", country: ""), current: Current(temp_c: 0.0))
    
    
    func fetch() {
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=077fc99ffc324655801183626223110&q=Barrie&aqi=no") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let weatherNow = try JSONDecoder().decode(WeatherNow.self, from: data)
                DispatchQueue.main.async {
                    self?.weather = weatherNow
                }
                
            }
            catch {
    
                print(error)
            }
        }
        task.resume()
    }
}


struct WeatherView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                if (viewModel.weather.current.temp_c > 20){
                Image(systemName: "thermometer.sun.fill")
                        .scaleEffect(4)
                        .foregroundColor(Color.yellow)
                }
                else if (viewModel.weather.current.temp_c <= 20 && viewModel.weather.current.temp_c > 5){
                    Image(systemName: "thermometer.low")
                        .scaleEffect(4)
                        .foregroundColor(Color.purple)
                }
                else {
                    Image (systemName: "thermometer.snowflake")
                        .scaleEffect(4)
                        .foregroundColor(Color.blue)
                }
                
                
                
                
                Text(String(format: "Weather in \(viewModel.weather.location.name) currently is %.0f ºC", viewModel.weather.current.temp_c))
                    .font(.title)
                    .foregroundColor(Color.purple)
                    .multilineTextAlignment(.center)
                    .padding(.top, 60.0)
                }.onAppear {
                    viewModel.fetch()
                    
                }.navigationTitle("Weather Now")
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
