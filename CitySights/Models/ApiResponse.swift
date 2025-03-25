//
//  ApiResponse.swift
//  CitySights
//
//  Created by Jade Hayes on 3/17/25.
//

import Foundation

struct ApiResponse: Codable {
    let businesses: [Business]
}

struct Business: Codable, Identifiable {
    let id: String?
    let alias: String
    let name: String
    let imageUrl: String
    let isClosed: Bool
    let url: String
    let reviewCount: Int
    let categories: [Category]
    var rating: Double
    let coordinates: Coordinates?
    let transactions: [String]
    let price: String?
    let location: Location
    let phone: String
    let displayPhone: String
    let distance: Double

    enum CodingKeys: String, CodingKey {
        case id, alias, name, url, categories, rating, coordinates, transactions, price, location, phone, distance
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
    }
    
    func getStars() -> String {
        if self.rating.isNaN {
            return "0"
        }
        let roundedRating = ceil(self.rating * 2) / 2
        if String(roundedRating).hasSuffix(".0") {
            let stars = String(roundedRating).prefix(1)
            return String(stars)
        }
        return roundedRating.description
    }
    
    func distanceInMiles() -> String {
        return String(format: "%.0f", ceil(self.distance * 0.000621371))
    }
}

struct Category: Codable {
    let alias: String
    let title: String
}

struct Coordinates: Codable {
    let latitude: Double?
    let longitude: Double?
}

struct Location: Codable {
    let address1: String
    let address2: String?
    let address3: String?
    let city: String
    let zipCode: String
    let country: String
    let state: String
    let displayAddress: [String]

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country, state
        case zipCode = "zip_code"
        case displayAddress = "display_address"
    }
}
