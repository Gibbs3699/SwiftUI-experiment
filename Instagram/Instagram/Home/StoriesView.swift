//
//  StoriesView.swift
//  Instagram
//
//  Created by TheGIZzz on 16/9/2565 BE.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0...10, id: \.self) { num in
                    StoryView(imageName: "foo")
                }
            }
        }
    }
}

struct StoryView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 80, height: 80, alignment: .center)
            .background(Color(.label))
            .cornerRadius(40)
            .padding(3)
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
