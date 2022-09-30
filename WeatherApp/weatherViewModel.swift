//
//  weatherViewModel.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 7/25/22.
//

import Foundation
import SwiftUI
import Combine



class WeatherViewModel: ObservableObject {

    @Published var title: String = ""
    @Published var description: String = ""
    @Published var temp: String = ""
    @Published var timezone: String = ""
    @Published var Cityname: String = ""
    var icon: String = ""
    @Published var image: UIImage? = nil
    
    var APIkey = "aa2064876416fc50ca41f01c58d361ab"
    var cancellables = Set<AnyCancellable>()
    private var imageSubscription: AnyCancellable?
    
//    init() {
//        self.getWeather(cityname: Cityname)
//        self.getImage()
//    }
 
    func getWeather(cityname: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityname)&appid=\(APIkey)&units=imperial") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 200 else { throw
                    URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: WeatherModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("\(completion)")
            } receiveValue: { [weak self] (returnedWeather) in
                self?.title = returnedWeather.name
                self?.temp = ("\(returnedWeather.main.temp)")
                self?.description = returnedWeather.weather.first?.description ?? "No description"
                self?.icon = (returnedWeather.weather[0].icon)
            }
            .store(in: &cancellables)

    }
    
    func getImage() {

        guard let url = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png") else { return  }

         URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
        .tryMap { (data, response) -> UIImage? in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else { throw
                URLError(.badServerResponse)
            }
            return UIImage(data: data)
        }
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { [weak self](returnedImage) in
                self?.image = returnedImage
            })
            .store(in: &cancellables)


    
}






}
