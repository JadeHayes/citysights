//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Jade Hayes on 3/17/25.
//

import SwiftUI

@main
struct CitySights: App {
    @State var businessModel = BusinessModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessModel)
        }
    }
}
