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
        VStack (spacing: 0){
            ZStack (alignment: .trailing){
                Image("detail-placeholder-image")
                    .resizable()
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
                .frame(height: 164)
                
                ZStack (alignment: .leading){
                    Rectangle()
                        .fill((b?.isClosed ?? false) ? Color.red : Color.green)
                        .frame(height:36)
                    Text((b?.isClosed ?? false) ? "Closed" : "Open")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal)
                }
            
            ScrollView (showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(b?.name ?? "")
                        .font(Font.system(size: 21))
                        .padding(.bottom, 10)
                    
                    Text("\(b?.location.address1 ?? ""), \(b?.location.city ?? "")")
                    Text(" \(b?.location.state ?? "") \(b?.location.zipCode ?? ""), \(b?.location.country ?? "")")
                        .padding(.bottom, 10)
                    
                    Image("regular_\(b?.getStars() ?? "")")
                        .padding(.bottom, 16)
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        Text("\(b?.phone ?? "")")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }.padding(.top, 12)
                    
                    Divider()
                        .padding(.top, 12)
                    HStack {
                        Image(systemName: "globe")
                        Text("\(b?.url ?? "")")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }.padding(.top, 12)
                    
                    Divider()
                    .padding(.top, 12)
                    
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(b?.reviewCount ?? 0) reviews")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }.padding(.top, 12)
                }
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
        url: "https://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/businesshttps://www.example.com/business",
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
