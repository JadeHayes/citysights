//
//  BusinessModel.swift
//  CitySights
//
//  Created by Jade Hayes on 3/23/25.
//

import Foundation
import SwiftUI

@Observable
class BusinessModel {
    var query: String = ""
    var businesses: [Business] = []
    var selectedBusiness: Business?
    
    // Data Service
    let service = DataService()
    
    func getBusinesses ()  {
        Task {
            businesses = await service.businessSearch(latitude: "33.8492", longitude: "-118.3884")
        }
    }
}
