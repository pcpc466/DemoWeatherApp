//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 8/28/22.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var vm : WeatherViewModel
    var body: some View {
        NavigationView{
        VStack{
            
            SearchBarView(searchText: $vm.Cityname)
                
            
            NavigationLink(
                destination:
                    WeatherView(),
                label: {
                    Text("Show Weather")
                        .foregroundColor(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .cornerRadius(12.0)
                })
                

         
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
       
        .background(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
        .ignoresSafeArea()
        .navigationTitle("Weather App")
        }
        .accentColor(.white)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(WeatherViewModel())
    }
}
