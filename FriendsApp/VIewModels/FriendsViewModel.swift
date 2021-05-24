//
//  FriendsViewModel.swift
//  FriendsApp
//
//  Created by MD Tanvir Alam on 23/5/21.
//

import Foundation
import SwiftUI

class FriendsViewModel:ObservableObject{
    
    @Published var friends = [FriendViewModel]()
    @Published var isLoading = true
    
    init(){
        self.getFriends()
    }
    
    private func getFriends() {
        FriendsWebServices.shared.getFriends {[weak self] result in
            switch result{
            case .success(let result):
                DispatchQueue.main.async {
                    self?.friends = result.results.map(FriendViewModel.init)
                    self?.isLoading = false
                }
            case .failure(let error):
                switch error{
                case .nodataAvailable:
                    print("Error: No data Available: \(error.localizedDescription)")
                case .invalidURL:
                    print("Error: invalid url: \(error.localizedDescription)")
                case .canNotProcessData:
                    print("Error: Can Not Process Data: \(error.localizedDescription)")
                case .encodingError:
                    print("Error: Encoding Error: \(error.localizedDescription)")
                case .statusCodeIsNotOkay:
                    print("Error: StatusCodeIsNot200 \(error)")
                }
            }
        }
    }
}

//This is a viewmodel for a single friend. We can modify the incomming data here
class FriendViewModel:Identifiable{
    var id = UUID()
    var friend:ResultModel
    init(friend:ResultModel){
        self.friend = friend
    }
    var nameTitle:String {
        return friend.name.title
    }
    
    var firstName: String{
        return friend.name.first
    }
    var lastName:String{
        return friend.name.last
    }
    var email:String{
        return friend.email
    }
    var phone:String{
        return friend.phone
    }
    var cell:String{
        return friend.cell
    }
    var street:String{
        return friend.location.street.name
    }
    var streetNumber:Int{
        return friend.location.street.number
    }
    var city:String{
        return friend.location.city
    }
    var state:String{
        return friend.location.state
    }
    var country:String{
        return friend.location.country
    }
    var largeImageURL:String{
        return friend.picture.large
    }
    var mediumImageURL:String{
        return friend.picture.medium
    }
    var smallImageURL:String{
        return friend.picture.thumbnail
    }
}


