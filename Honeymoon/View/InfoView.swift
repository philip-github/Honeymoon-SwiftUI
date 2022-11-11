//
//  InfoView.swift
//  Honeymoon
//
//  Created by Philip Al-Twal on 11/4/22.
//

import SwiftUI

struct InfoView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    //MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer()
                Text("App Info")
                    .fontWeight(.heavy)
                    .modifier(TitleModifier())

                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                Button {
                    dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }//: BUTTON
            }//: VSTACK
            .frame(minWidth: 0,
                   maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }//: SCROLL VIEW
    }//: BODY
}


//MARK: - APP INFO VIEW

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            RowAppInfoView(itemOne: "Application",
                           itemTwo: "Honeymoon")
            
            RowAppInfoView(itemOne: "Compatibility",
                           itemTwo: "iPhone and iPad")
            
            RowAppInfoView(itemOne: "Developer",
                           itemTwo: "Philip Al-Twal")
            
            RowAppInfoView(itemOne: "Designer",
                           itemTwo: "Robert Petras")
            
            RowAppInfoView(itemOne: "Website",
                           itemTwo: "swiftuimasterclass.com")
            
            RowAppInfoView(itemOne: "Version",
                           itemTwo: "1.0.0")
        }//: VSTACK
    }//: BODY
}

//MARK: - ROW APP INFO VIEW

struct RowAppInfoView: View {
    //MARK: - PROPERTIES
    
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack{
            HStack{
                Text(itemOne)
                    .foregroundColor(.gray)
                Spacer()
                Text(itemTwo)
            }//: HSTACK
            Divider()
        }//: VSTACK
    }
}

//MARK: - CREDITS VIEW

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                Text("Photos")
                    .foregroundColor(.gray)
                Spacer()
                Text("Unsplash")
            }//: HSTACK
            Divider()
            Text("Photographers")
                .foregroundColor(.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }//: VSTACK
    }
}

//MARK: - PREVIEW

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
