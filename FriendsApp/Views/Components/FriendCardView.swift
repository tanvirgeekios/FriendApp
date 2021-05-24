//
//  FriendCardView.swift
//  FriendsApp
//
//  Created by MD Tanvir Alam on 23/5/21.
//

import SwiftUI

struct FriendCardView: View {
    var title:String
    var firstName:String
    var lastName:String
    var imageUrl:String
    var country:String
    
    var body: some View {
        
        HStack(alignment:.center, spacing: 10){
            if let url = URL(string: imageUrl){
                AsyncImage(url: url,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() })
                    .frame(width:400,height:300)
            }
            VStack(alignment:.leading, spacing:10){
                Text("\(title) \(firstName) \(lastName)")
                    .font(.title)
                    .fontWeight(.bold)
                Text(country)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
        }.background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        
        
    }
}

struct FriendCardView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCardView(title: "MR", firstName: "Tanvir", lastName: "Alam", imageUrl: "https://www.google.com", country: "Bangladesh")
    }
}
