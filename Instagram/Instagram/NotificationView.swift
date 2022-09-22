//
//  NotificationView.swift
//  Instagram
//
//  Created by TheGIZzz on 15/9/2565 BE.
//

import SwiftUI

struct NotificationView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                List(0 ..< 30) { item in
                    if item%2 == 0 {
                        NotificationFollowView()
                    } else {
                        NotificationLikeView()
                    }
                }
            }
            .navigationTitle("Notification")
        }
    }
}

struct NotificationFollowView: View {
    var userNames = (1...5).map({ "user\($0)" }).randomElement()
    
    var body: some View {
        HStack {
            if let user = userNames {
                Image(user)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text("\(user) started following you.")
                    Text("\(Int.random(in: 0...59)) minutes ago")
                        .foregroundColor(Color(.secondaryLabel))
                }
                
                Spacer()
                
                Button(action: {
                    //
                }) {
                    Text("Follow")
                        .frame(width: 80, height: 30, alignment: .center)
                        .foregroundColor(.white)
                        .background(Color(.link))
                        .cornerRadius(8)
                    
                }
            }
        }
    }
}

struct NotificationLikeView: View {
    var userImageName = "user\(Int.random(in: 1...5))"
    var imageName = "image\(Int.random(in: 1...5))"
    
    var body: some View {
        HStack {
            Image(userImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text("\(userImageName) liked you your post.")
                Text("\(Int.random(in: 0...59)) minutes ago")
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            let image = Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44, alignment: .center)
                       
            NavigationLink(destination: {
                PostView(userImageName: userImageName, imageName: imageName)
            }) {
                Spacer()
                image
            }
            .frame(width: 44, height: 44, alignment: .center)
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
