//
//  FriendsView.swift
//  FriendsApp
//
//  Created by MD Tanvir Alam on 23/5/21.
//

import SwiftUI

struct FriendsView: View {
    @StateObject var friendsViewModel = FriendsViewModel()
    
    var body: some View {
        
        if friendsViewModel.isLoading{
            ProgressView()
        }else{
            ScrollView{
                ForEach(friendsViewModel.friends){ friend in
                    VStack{
                        NavigationLink(destination: FriendDetailView(friend:friend)) {
                            FriendCardView(title: friend.nameTitle, firstName: friend.firstName, lastName: friend.lastName, imageUrl: friend.largeImageURL, country: friend.country)
                        }
                        
                    }
                }.navigationTitle("Friends")
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
