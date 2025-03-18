//
//  DataService.swift
//  CitySights
//
//  Created by Jade Hayes on 3/17/25.
//

import Foundation

struct YelpAPI {
    let apiKey: String
    let base: String
    let version: String

    init() {
        self.apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
        self.base = "https://api.yelp.com/v3"
        self.version = "v3"
    }
    
    func getBusinesses(location: String) async throws -> [Business]? {
        let url = URL(string: "\(self.base)/businesses/search")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "sort_by", value: "best_match"),
          URLQueryItem(name: "limit", value: "20"),
          URLQueryItem(name: "location", value: location)
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.addValue("Bearer " + self.apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = ["accept": "application/json"]
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        do {
            let yelpResponse = try decoder.decode(ApiResponse.self, from: data)
            return yelpResponse.businesses
        } catch {
            print("error decoding JSON: \(error)")
            return nil
        }
    }
}
