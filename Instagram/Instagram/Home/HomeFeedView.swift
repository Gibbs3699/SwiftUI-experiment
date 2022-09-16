//
//  HomeFeedView.swift
//  Instagram
//
//  Created by TheGIZzz on 15/9/2565 BE.
//

import SwiftUI

struct HomeFeedView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    StoriesView()
                    
                    ForEach(0...30, id: \.self) { num in
                        PostView()
                            .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("Instragram")
        }
    }
}

struct PostView: View {
    var body: some View {
        VStack {
            PostHeaderView()
            
            HStack {
                Image("foo")
                    .frame(width: 430, height: 430, alignment: .center)
                .background(Color.gray)
            }
            
            PostActionButtonsView()

            HStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(Color.red)
                
                Text("1,000 Likes")
                    .font(.system(size:20))
                    .foregroundColor(Color(.label))
                    .bold()
                
                Spacer()
            }
            .padding()
            .padding(.top, -20)
        
            Text("Oh i wish everything is going to be fine, don't worry, be happy 😆")
                .font(.headline)
                .padding(.top, -15)
            
            HStack {
                Text("1 hour ago")
                    .foregroundColor(Color(.secondaryLabel))
                .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.leading, 10)
            
        }
            
    }
}

struct PostHeaderView: View {
    var body: some View {
        
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(Color(.label))
            
            Text("user")
                .foregroundColor(Color(.label))
                .bold()
            
            Spacer()
        }
        .padding()
        
    }
}

struct PostActionButtonsView: View {
    var body: some View {
        HStack {
            Button {
                //
            } label: {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            }
            .padding(.trailing, 10)
            
            Button {
                //
            } label: {
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            }
            .padding(.trailing, 10)
            
            Button {
                //
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            }
            .padding(.trailing, 10)
            
            Spacer()
        }
        .padding()
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
