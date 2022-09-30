//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 8/29/22.
//

import Foundation

extension Date {

 static func getCurrentDate() -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "E d MMM yyyy h:mm a "

        return dateFormatter.string(from: Date())

    }
}
struct WeatherModel: Identifiable, Codable {
    
    let timezone: Int
    let main: mainWeather
    let weather: [WeatherInfo]
    let name: String
    let id: Int
}




struct WeatherInfo: Codable {
  
    let description: String
    let icon: String
   
}
struct mainWeather: Codable {
    let temp: Double
}

//"https://openweathermap.org/img/w/" + (returnedWeather.weather[0].icon) + ".png"
