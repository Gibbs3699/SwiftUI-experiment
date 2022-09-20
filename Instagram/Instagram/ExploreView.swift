//
//  ExploreView.swift
//  Instagram
//
//  Created by TheGIZzz on 15/9/2565 BE.
//

import SwiftUI

struct ExploreView: View {
    @State var text = ""
    
    var imageNames = (1...5).map({ "image\($0)" })
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 200)),
        GridItem(.flexible(minimum: 200))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $text)
                    .padding(10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, content: {
                        ForEach(0...20, id: \.self) { num in
                            Image(imageNames.randomElement() ?? "image1")
                                .resizable()
                                .frame(width: 200, height: 200, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(Color.red)
                            
                        }
                    })
                }
            }
            .navigationTitle("Explore")

        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
