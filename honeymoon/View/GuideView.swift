//
//  GuideView.swift
//  honeymoon
//
//  Created by Umair Riaz on 23/10/2021.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var presentaionMode
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                HeaderComponent()
                Text("Get Started")
                    .fontWeight(.heavy)
                    .padding()
                Text("Discover and pick the the perfect destination for your romantic honeymoon.")
                    .multilineTextAlignment(.center)
                    .padding()
                GuideComponent(title: "Like", subTitle: "Swipe Right", description: "Do you like the destenation? Swipe Right and It will be stored in favourite.", icon: "heart.circle")
                    .padding()
                GuideComponent(title: "Dismiss", subTitle: "Swipe Left", description: "You reather skip this destination? Swipe Left and you will no longer see it.", icon: "xmark.circle")
                    .padding()
                GuideComponent(title: "Book", subTitle: "Tap the button", description: "Our Selection of honeymoon resorts is perfect setting for you to embark your new life together.", icon: "checkmark.square")
                    .padding()
                Spacer(minLength: 10)
                Button(action: {
                    self.presentaionMode.wrappedValue.dismiss()
                }){
                    Text("Continue".uppercased())
                    .modifier(DismissModifier())
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 25)
            .padding(.top, 15)
            .padding(.bottom, 25)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
