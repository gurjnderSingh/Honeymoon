//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 20/03/23.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Capsule().fill(Color.pink)
            )
            .foregroundColor(Color.white)
    }
}
