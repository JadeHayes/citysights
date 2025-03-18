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
    @State var selectedBusiness: Business?
    var body: some View {
        List {
            ForEach(businesses, id: \.id) { business in
                var distance = business.distanceInMiles()
                VStack (spacing: 20) {
                    HStack (spacing: 0){
                        Image("list-placeholder-image")
                            .padding(.trailing, 16)
                        VStack (alignment: .leading){
                            Text(business.name)
                                .font(Font.system(size: 15))
                                .bold()
                            Text("\(distance) mile\(distance == "1" ? "" : "s") away")
                                .font(Font.system(size: 16))
                                .foregroundStyle(Color(red: 67/255, green: 72/255, blue: 76/255))
                        }
                        Spacer()
                        Image("regular_\(business.getStars())")
                    }
                    Divider()
                }
                .onTapGesture {
                    selectedBusiness = business
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .task {
                do {
                    let response = try await yelpAPI.getBusinesses(latitude: "33.8492", longitude: "-118.3884")
                    businesses = response
    
                } catch {
                    print("error: \(error)")
                }
            }
        .sheet(item: $selectedBusiness) { b in
            DetailView(b: b)
        }
    }
}

#Preview {
    ContentView()
}
