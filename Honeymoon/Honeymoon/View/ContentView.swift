//
//  ContentView.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 17/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HeaderView()
            
            CardView(honeymoon: honeyMoonData[2])
                .padding()
            
            Spacer()
            
            FooterView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
