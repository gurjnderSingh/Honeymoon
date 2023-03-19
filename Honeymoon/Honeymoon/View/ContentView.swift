//
//  ContentView.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 17/03/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    @State var showAlert: Bool = false
        
    var body: some View {
        VStack {
            
            HeaderView()
            
            Spacer()
            
            CardView(honeymoon: honeyMoonData[2])
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
