//
//  DetailView.swift
//  CitySights
//
//  Created by Jade Hayes on 3/18/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(BusinessModel.self) var model

    var body: some View {
        let b = model.selectedBusiness
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
    DetailView()
}
