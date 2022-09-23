//
//  ProfileView.swift
//  Instagram
//
//  Created by TheGIZzz on 15/9/2565 BE.
//

import SwiftUI

struct ProfileView: View {
    
    var columns: [GridItem] = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ProfileHeaderView()
                
                LazyVGrid(columns: columns, spacing: 1, content: {
                    ForEach(0...40, id: \.self) { num in
                        let imageName = "image\(Int.random(in: 1...5))"
                        
                        NavigationLink(
                            destination: PostView(
                                userImageName: "user2",
                                imageName: imageName
                            ),
                            label: {
                            Image(imageName)
                                .resizable()
                                .frame(width: 150, height: 150, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                        })
                    }
                })
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct HeaderCountButtonsView: View {
    var body: some View {
        HStack {
            VStack {
                Button(action: {
                    
                }) {
                    Text("40\n Posts")
                        .foregroundColor(Color(.label))
                        .multilineTextAlignment(.center)
                }
            }
            
            
            VStack {
                Button(action: {
                    
                }) {
                    Text("1M\n Followers")
                        .foregroundColor(Color(.label))
                        .multilineTextAlignment(.center)
                }
            }
            
            VStack {
                Button(action: {
                    
                }) {
                    Text("40\n Following")
                        .foregroundColor(Color(.label))
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("user1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                    .padding()
                
                VStack {
                    HeaderCountButtonsView()
                    
                    Button(action: {
                        
                    }) {
                        Text("Edit Profile")
                            .frame(width: 280, height: 35, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(.black.withAlphaComponent(0.8)))
                            .cornerRadius(8)
                        
                    }
                }
                
            }
            
            HStack {
                Text("This is my bio")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 20)
                    .padding(.leading, 15)
                Spacer()
            }
        }
        .padding()
    }
}
