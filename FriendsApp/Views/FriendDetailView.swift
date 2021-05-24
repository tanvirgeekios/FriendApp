//
//  FriendDetailView.swift
//  FriendsApp
//
//  Created by MD Tanvir Alam on 24/5/21.
//

import SwiftUI
import MessageUI

struct FriendDetailView: View {
    var friend:FriendViewModel
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        
        VStack(alignment:.leading, spacing: 10){
            VStack{
                if let url = URL(string: friend.largeImageURL){
                    AsyncImage(url: url,
                               placeholder: { Text("Loading ...") },
                               image: {
                                Image(uiImage: $0).resizable()
                               })
                }
            }
            
            VStack(alignment:.leading, spacing:10){
                Text("\(friend.nameTitle) \(friend.firstName) \(friend.lastName)")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Address: \(friend.street)")
                Text("City: \(friend.city)")
                Text("State \(friend.state)")
                Text("Country: \(friend.country)")
                
                //Sending email On Tap, Test it in real device
                Text("Email: \(friend.email) (Tap me to send email)")
                    .onTapGesture(count: 1) {
                        print("I am tapped")
                        self.isShowingMailView.toggle()
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                                MailView(result: self.$result)
                    }
                
                Text("Cell: \(friend.cell)")
            }.foregroundColor(Color.black)
            .font(.title2)
            .padding()
            Spacer()
        }
        .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .navigationTitle("Friend Detail")
        
        
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(friend: FriendViewModel(friend: ResultModel(name: NameModel(title: "MD", first: "Tanvir", last: "Alam"), location: LocationModel(street: StreetModel(number: 12343, name: "BosePara"), city: "Dhaka", state: "California", country: "Bangladesh"), email: "Tanvirgeek@gmail.com", phone: "01784818346", cell: "09394984", picture: PictureModel(large: "https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg", medium: "https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg", thumbnail: "https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg"))))
    }
}
