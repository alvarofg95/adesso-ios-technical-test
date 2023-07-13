//
//  WeatherView.swift
//  technical-test
//
//  Created by Fernandez, Alvaro on 3/7/23.
//

import SwiftUI

struct CurrentWheater: Decodable {
    var temperature: Double
    var windspeed: Double
    var winddirection: Double
    var weathercode: Int
    
    public var formattedTemperature: String {
        get {
            return "\(Int(self.temperature)) grados"
        }
    }
}
struct WeatherResponse: Decodable {
    var current_weather: CurrentWheater
}

struct WeatherView: View {
    public var longitude: Double;
    public var latitude: Double;
    @State var temperature: String = "";
    @State var winDirection: Double = 0;

    var body: some View {
        VStack {
            Text("Weather").font(.title)
            Text("Temperatura: \(self.temperature)")
            Text("Dirección del viento: \(self.winDirection)")
            
        }.onAppear {
            self.searchWeatherData(longitude: self.longitude, latitude: self.latitude) { response in
            
                self.temperature = response?.current_weather.formattedTemperature ?? ""
                self.winDirection = response?.current_weather.winddirection ?? 0
            }
        }
        .padding()
    }
    func getBoolValue(number : Int, completion: (Bool)->()) {
        if number > 5 {
            completion(true)
        } else {
            completion(false)
        }
    }
    
    private func searchWeatherData(longitude: Double, latitude: Double,  completion: @escaping (WeatherResponse?)->()) {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current_weather=true")!
      

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if data != nil {
                let decoder = JSONDecoder()
                let jsonData = try? decoder.decode(WeatherResponse.self, from: data!)
                completion(jsonData)
                return;
            }
        }
        task.resume()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(longitude: 2.061824325751162, latitude: 41.475238522667034 )
    }
}
