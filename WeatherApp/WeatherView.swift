//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 8/28/22.
//

import SwiftUI

struct WeatherView: View {
    @EnvironmentObject var vm : WeatherViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
                ZStack{
        Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))
                    //Weather UI
                        VStack {
                            
                            VStack(alignment: .leading, spacing: 5){
                                
                                Text(vm.title)
                                    .bold().font(.title)
                                    .fontWeight(.light)
                                    .italic()
                                Text(" \(Date.getCurrentDate()) ")
                            }
                            .padding(.top, 60)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            VStack(spacing: 0) {
                                WeatherIconView()
                                    .frame(width: 150, height: 110)
                                    .padding(.leading, 200)
                                Image(uiImage: #imageLiteral(resourceName: "city-4791269_960_720"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)

                            }
            
                            VStack{
                                HStack{
                                    VStack {
                                        //This is the image we have to replace
//                                       
                                           
                                        Text(vm.description)
                                            .autocapitalization(.allCharacters)
                                  
                                    }
                                    Spacer()
                                    Text("\(vm.temp)°F")
                                        .font(.system(size: 50))
                                        .fontWeight(.bold)
                                }
                               Spacer()
                                
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                    vm.image = nil
                                }, label: {
                                        Text("Change City")
                                            .foregroundColor(Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)))
                                            .frame(width: 250, height: 50, alignment: .center)
                                            .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                            .cornerRadius(12.0)
                                    
                                })
                        
                                Spacer()
                            }
                            .padding()
                            .frame(height: 250)
                            .frame(maxWidth: .infinity)
                        }
                        .foregroundColor(.white)
                        .frame(maxHeight: .infinity)
                        .padding()
                }
                .onAppear(perform: {
                    vm.getWeather(cityname: vm.Cityname)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        vm.getImage()
                    }
                    
                })
             
                .ignoresSafeArea()

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
            .environmentObject(WeatherViewModel())
    }
}

