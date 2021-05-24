//
//  ContentView.swift
//  FriendsApp
//
//  Created by MD Tanvir Alam on 23/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            SidebarView()
            //PrimaryView()
            FriendsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
