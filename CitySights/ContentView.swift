//
//  ContentView.swift
//  CitySights
//
//  Created by Jade Hayes on 3/17/25.
//

import SwiftUI

struct ContentView: View {
    let yelpAPI = YelpAPI()
    @State var businesses: [Business] = []
    var body: some View {
        ForEach(businesses, id: \.id) { business in
            Text(business.name)
        }
        .padding()
        .task {
                do {
                    let response = try await yelpAPI.getBusinesses(latitude: "33.8492", longitude: "-118.3884")
                    businesses = response ?? []
    
                } catch {
                    print("error: \(error)")
                }
            }
    }
}

#Preview {
    ContentView()
}
