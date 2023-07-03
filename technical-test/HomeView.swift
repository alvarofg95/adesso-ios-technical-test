//
//  HomeView.swift
//  technical-test
//
//  Created by Fernandez, Alvaro on 3/7/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showWelcomeView = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to our Live Coding Session")
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Text("To start de Test, press START")
                    .padding(.vertical, 30.0)
                    .font(.title)
                NavigationLink("Start", destination: CoordinadesView())
                    .frame(width: 100.0, height: 40.0)
                    .background(.blue)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .cornerRadius(14)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
