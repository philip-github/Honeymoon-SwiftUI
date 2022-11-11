//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}
