//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Jade Hayes on 3/17/25.
//

import SwiftUI

@main
struct CitySightsApp: App {
    @State var businessModel = BusinessModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(businessModel)
        }
    }
}
