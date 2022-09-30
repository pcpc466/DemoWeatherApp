//
//  SearchBarView.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 8/28/22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack{
            
            TextField("  Please entre the city", text: $searchText)
               
                .frame(height: 55)
                .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                .cornerRadius(12.0)
                .padding()
                
         
           
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
