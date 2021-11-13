//
//  InfoView.swift
//  honeymoon
//
//  Created by Uzair Riaz on 01/11/2021.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .center, spacing: 8) {
                    HeaderComponent()
                    
                    Spacer(minLength: 10)
                    
                    Text("App Info")
                        .fontWeight(.black)
                        .modifier(TitleModifier())
                    
                    AppInfoView()
                    
                    Text("Credits")
                        .fontWeight(.black)
                        .modifier(TitleModifier())
                    
                    CreditView()
                    
                    Spacer(minLength: 10)
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Continue".uppercased())
                            .modifier(DismissModifier())
                    }
                    
            }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 15)
                .padding(.bottom, 25)
                .padding(.horizontal, 25)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Uzair Riaz")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Robert Petras")
            RowAppInfoView(itemOne: "Website", itemTwo: "swiftuimasterclass.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {
    //Mark: PROPERTIES
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        HStack {
            Text(itemOne).foregroundColor(Color.gray)
            Spacer()
            Text(itemTwo)
        }
        Divider()
    }
}

struct CreditView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack {
                Text("Photos").foregroundColor(Color.gray)
                Spacer()
                Text("Unsplash")
            }
            
            Divider()
            
            Text("Photographers").foregroundColor(Color.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
        
    }
}
