//
//  GuideView.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 18/03/23.
//

import SwiftUI

struct GuideView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer()
                
                Text("Get Started")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                
                Text("Discover and pick the perfect destination for your romantic honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like",
                        subTitle: "Swipe right",
                        description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites",
                        icon: "heart.circle")
                    
                    GuideComponent(
                        title: "Dismiss",
                        subTitle: "Swipe left",
                        description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                        icon: "xmark.circle")
                    
                    GuideComponent(
                        title: "Book",
                        subTitle: "Tap the button",
                        description: "Our selection of honeymoon resorts is perfect setting for you to embark you new life together.",
                        icon: "checkmark.square")
                }
                
                Spacer(minLength: 10)
                
                Button {
                    
                } label: {
                    Text("continue".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            Capsule().fill(Color.pink)
                        )
                        .foregroundColor(Color.white)
                }

                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 15)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
