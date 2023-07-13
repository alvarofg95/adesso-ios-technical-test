//
//  ContentView.swift
//  technical-test
//
//  Created by Fernandez, Alvaro on 2/7/23.
//

import SwiftUI

struct CoordinadesView: View {
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    var body: some View {
        NavigationStack {
            Text("Weather form").font(.title).foregroundColor(.blue).fontWeight(.bold)
            VStackLayout {
                TextField("Latitude", text: $latitude)
                    .padding([.top, .leading, .bottom], 10.0)
                    .keyboardType(.numberPad)
                    .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                TextField("Longitude", text: $longitude)
                    .padding(.all, 10.0)
                    .keyboardType(.numberPad)
                    .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.gray, lineWidth: 1)
                        )
            }.padding(.vertical, 40.0)
            NavigationLink("Send Data", destination: WeatherView(longitude: Double(self.latitude) ?? 0, latitude: Double(self.longitude) ?? 0))
                .frame(width: 120.0, height: 40.0)
                .background(.blue)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .cornerRadius(15)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinadesView()
    }
}
