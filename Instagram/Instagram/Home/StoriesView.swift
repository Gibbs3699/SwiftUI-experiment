//
//  StoriesView.swift
//  Instagram
//
//  Created by TheGIZzz on 16/9/2565 BE.
//

import SwiftUI

struct StoriesView: View {
    let data = (1...5).map({ "user\($0)"})
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data, id: \.self) { imageName in
                    StoryView(imageName: imageName)
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
            .aspectRatio(contentMode: .fill)
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
