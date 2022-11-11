//
//  GuideView.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct GuideView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer(minLength: 10)
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Like",
                                   subtitle: "Swipe Right",
                                   description: "Do you like this destination? Touch the screen and swipe right. It will save to the favourites.",
                                   icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss",
                                   subtitle: "Swipe Left",
                                   description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                                   icon: "xmark.circle")
                    
                    GuideComponent(title: "Book",
                                   subtitle: "Tap The Button",
                                   description: "Our selection of honeymoon resorts its perfect setting for you to embark your new life together.",
                                   icon: "checkmark.square")
                }//: VSTACK
                Spacer(minLength: 10)
                Button {
                    dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                    
                }//: BUTTON
            }//: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }//: SCROLL VIEW
    }//: BODY
}

//MARK: - PREVIEW

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
