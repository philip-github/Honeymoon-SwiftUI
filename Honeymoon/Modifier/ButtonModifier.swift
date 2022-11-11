//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0,
                   maxWidth: .infinity)
            .background(
                Capsule().fill(.pink)
            )
            .foregroundColor(.white)
    }
}
