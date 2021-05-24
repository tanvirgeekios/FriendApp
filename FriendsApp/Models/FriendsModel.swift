//
//  FriendsModel.swift
//  FriendsApp
//
//  Created by MD Tanvir Alam on 23/5/21.
//

import Foundation

struct FriendsModel:Codable{
    var results:[ResultModel]
}

struct ResultModel:Codable {
    var name:NameModel
    var location: LocationModel
    var email:String
    var phone :String
    var cell:String
    var picture:PictureModel
}
struct NameModel:Codable{
    var title :String
    var first:String
    var last:String
}
struct LocationModel:Codable {
    var street :StreetModel
    var city :String
    var state :String
    var country:String
}
struct StreetModel:Codable {
    var number :Int
    var name :String
}
struct PictureModel:Codable {
    var large:String
    var medium:String
    var thumbnail:String
    
}


//struct FriendsModel:Decodable{
//    var results: [ResultModel]
//}
//
//struct ResultModel:Decodable {
//    var name: Name
//    var location : Location
//    var email: String
//    var phone : String
//    var cell: String
//    var picture : Picture
//}
//
//struct Name:Decodable{
//    var title: String
//    var first: String
//    var last: String
//}
//
//struct Location:Decodable {
//    var street: StreetModel
//    var city : String
//    var state: String
//    var country:String
//    var postcode: Int
//}
//struct StreetModel:Decodable {
//    var number:Int
//    var name : String
//}
//struct Picture:Decodable{
//    var large : String
//    var medium: String
//    var thumbnail: String
//}
