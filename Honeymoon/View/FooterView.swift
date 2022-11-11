//
//  FooterView.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct FooterView: View {
    //MARK: - PROPERTIES
    let haptics = UINotificationFeedbackGenerator()
    @Binding var showBookingAlert: Bool
    
    //MARK: - BODY
    var body: some View {
        HStack{
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            Spacer()
            
            Button {
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                showBookingAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(.pink)
                    .background(
                        Capsule().stroke(.pink, lineWidth: 2)
                    )
            }//: BUTTON
            
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }//: HSTACK
        .padding()
    }//: BODY
}

//MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    static var previews: some View {
        FooterView(showBookingAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
