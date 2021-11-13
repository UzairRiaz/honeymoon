//
//  GuideComponent.swift
//  honeymoon
//
//  Created by Umair Riaz on 23/10/2021.
//

import SwiftUI

struct GuideComponent: View {
    
    var title: String
    var subTitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20){
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color.pink)
            VStack(alignment: .leading, spacing: 4){
                HStack{
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subTitle.uppercased())
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                Divider()
                    .padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subTitle: "Swipe Right", description: "This is Place Holder. That will be changed by the end of the Development.", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
