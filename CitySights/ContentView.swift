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
        .onAppear() {
            Task {
                do {
                    let response = try await yelpAPI.getBusinesses(location: "redondo beach")
                    businesses = response ?? []
    
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
