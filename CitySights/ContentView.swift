//
//  ContentView.swift
//  CitySights
//
//  Created by Jade Hayes on 3/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        
        @Bindable var model = model
        
        VStack {
            HStack {
                TextField("What are you looking for?", text: $model.query)
                Button {
                    // TODO: Implement query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            List {
                ForEach(model.businesses, id: \.id) { business in
                    let distance = business.distanceInMiles()
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
                        model.selectedBusiness = business
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .onAppear {
                model.getBusinesses()
            }
            .sheet(item: $model.selectedBusiness) { b in
                DetailView()
            }
        }
    }
}

#Preview {
    var businessModel = BusinessModel()
    ContentView()
        .environment(businessModel)
}

