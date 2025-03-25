//
//  MapView.swift
//  CitySights
//
//  Created by Jade Hayes on 3/24/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(BusinessModel.self) var model
    @State var selectedBusinessId: String?

    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(model.businesses, id: \.id) { b in
                Marker(b.name, coordinate: CLLocationCoordinate2D(latitude:  b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
                    .tag(b.id ?? "None")
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            let business = model.businesses.first(where: { $0.id == newValue })
            
            // This is the same as if business != nil but if we did that we would need to unwrap it.
            if let business = business {
                model.selectedBusiness = business
            }
        }
    }
}

#Preview {
    MapView()
}
