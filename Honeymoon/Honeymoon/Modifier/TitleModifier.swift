//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Gurjinder Singh on 20/03/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content)-> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
