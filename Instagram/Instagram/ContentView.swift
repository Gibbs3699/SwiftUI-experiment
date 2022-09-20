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
                .preferredColorScheme(.dark)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "safari")
                    
                    Text("Explore")
                }
                .preferredColorScheme(.dark)
            
            CameraView()
                .tabItem {
                    Image(systemName: "camera")
                    
                    Text("Camera")
                }
                .preferredColorScheme(.dark)
            
            NotificationView()
                .tabItem {
                    Image(systemName: "bell")
                    
                    Text("Notifications")
                }
                .preferredColorScheme(.dark)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    
                    Text("Profile")
            }
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
