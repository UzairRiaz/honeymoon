//
//  HeaderComponent.swift
//  honeymoon
//
//  Created by Umair Riaz on 23/10/2021.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Capsule()
                .frame(width: 120, height: 6, alignment: .center)
                .foregroundColor(Color.secondary)
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 26)
        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
