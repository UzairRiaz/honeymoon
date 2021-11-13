//
//  TitleModifier.swift
//  honeymoon
//
//  Created by Uzair Riaz on 01/11/2021.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
