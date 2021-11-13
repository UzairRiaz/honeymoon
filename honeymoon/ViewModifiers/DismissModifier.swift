//
//  DismissModifier.swift
//  honeymoon
//
//  Created by Uzair Riaz on 03/11/2021.
//

import SwiftUI

struct DismissModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(Capsule().fill(Color.pink))
    }
}
