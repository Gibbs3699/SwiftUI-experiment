//
//  ContentView.swift
//  Instagram
//
//  Created by TheGIZzz on 14/9/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeFeedView()
                .tabItem {
                    Image(systemName: "house")
                    
                    Text("Home")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "safari")
                    
                    Text("Explore")
                }
            
            CameraView()
                .tabItem {
                    Image(systemName: "camera")
                    
                    Text("Camera")
                }
            
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                    
                    Text("Notifications")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    
                    Text("Profile")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
