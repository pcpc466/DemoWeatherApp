//
//  WeatherIconView.swift
//  WeatherApp
//
//  Created by Prashant Singh chauhan on 8/29/22.
//

import SwiftUI

struct WeatherIconView: View {
    @EnvironmentObject var vm : WeatherViewModel
    var body: some View {
        if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            ProgressView()
                                               }
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconView()
            .environmentObject(WeatherViewModel())
            .previewLayout(.sizeThatFits)
    }
}
