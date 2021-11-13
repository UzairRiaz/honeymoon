//
//  FooterView.swift
//  honeymoon
//
//  Created by Umair Riaz on 20/10/2021.
//

import SwiftUI

struct FooterView: View {
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack{
            Image(systemName: "xmark.circle")
                .font(.system(size: 48, weight: .regular))
                .padding()
            Spacer()
            Button(action: {self.showBookingAlert.toggle()}){
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                    )
            }
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 48, weight: .regular))
                .padding()
        }
        
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
