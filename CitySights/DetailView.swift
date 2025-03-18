//
//  DetailView.swift
//  CitySights
//
//  Created by Jade Hayes on 3/18/25.
//

import SwiftUI

struct DetailView: View {
    var b: Business?
    var body: some View {
        VStack {
            Text(b?.name ?? "")
            ZStack {
                Image("detail-placeholder-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 500, height: 200)
                    .clipped()
                Rectangle()
                    .fill((b?.isClosed ?? false) ? Color.red : Color.green)
                    .frame(height:50)
            }
            
            ScrollView (showsIndicators: false) {
                
            }
        }
    }
}

#Preview {
    DetailView(b: Business(
        id: "123",
        alias: "hello",
        name: "Business Name",
        imageUrl: "https://via.placeholder.com/300",
        isClosed: false,
        url: "https://www.example.com/business",
        reviewCount: 120,
        categories: [
            Category(alias: "coffee", title: "Coffee & Tea"),
            Category(alias: "bakery", title: "Bakeries")
        ],
        rating: 4.5,
        coordinates: Coordinates(latitude: 34.0522, longitude: -118.2437),
        transactions: ["pickup", "delivery"],
        price: "$$",
        location: Location(
            address1: "123 Main Street",
            address2: "Suite 100",
            address3: nil,
            city: "Los Angeles",
            zipCode: "90012",
            country: "US",
            state: "CA",
            displayAddress: ["123 Main Street", "Los Angeles, CA 90012"]
        ),
        phone: "+1234567890",
        displayPhone: "(123) 456-7890",
        distance: 1500.0 // 1.5km
    ))
}
