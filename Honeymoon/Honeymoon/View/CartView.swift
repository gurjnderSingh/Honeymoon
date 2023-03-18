//
//  CartView.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 18/03/23.
//

import SwiftUI

struct CartView: View {
    //MARK: - Properties
    
    let id = UUID()
    var honeymoon: Destination
    
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    Text(honeymoon.country.uppercased())
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1)
                            , alignment: .bottom
                        )
                    
                    Text(honeymoon.place.uppercased())
                        .foregroundColor(Color.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(Color.white)
                        )
                    
                }
                .padding()
                , alignment: .bottom
            )
            
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(honeymoon: honeyMoonData[2])
            .previewLayout(.sizeThatFits)
    }
}
