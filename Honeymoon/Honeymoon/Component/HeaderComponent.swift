//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 18/03/23.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack (alignment: .center, spacing: 20){
            Capsule()
                .frame(width: 128, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
        .padding()
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.sizeThatFits)
    }
}
