//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 7/23/22.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))]
    }
    @StateObject var vm = WeatherViewModel()
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(vm)
        }
    }
}
