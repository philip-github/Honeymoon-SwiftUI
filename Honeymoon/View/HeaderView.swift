//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - PROPERTIES
    let haptics = UINotificationFeedbackGenerator()
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    //MARK: - BODY
    var body: some View {
        HStack{
            Button {
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
                    
            }//: BUTTON
            .accentColor(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            Button {
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }//: BUTTON
            .accentColor(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }//: HSTACK
        .padding()
    }//: BODY
}


//MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
