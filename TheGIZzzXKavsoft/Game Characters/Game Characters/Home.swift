//
//  Home.swift
//  Game Characters
//
//  Created by TheGIZzz on 29/5/2566 BE.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Films"
    
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    var categories: [String] = ["Films","Localities"]
    
    var body: some View {
        ZStack {
            backgroundView()
            
            VStack {
                navigationBar()
            }
        }
    }
    
    @ViewBuilder
    func navigationBar()->some View{
        HStack(spacing: 0){
            ForEach(categories,id: \.self){tab in
                Button {
                    withAnimation{
                        currentTab = tab
                    }
                } label: {
                 
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical,6)
                        .padding(.horizontal,20)
                        .background {
                            if currentTab == tab {
                                Capsule()
                                    .fill(.regularMaterial)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                currentTab = tab
                            }
                        }
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func backgroundView()->some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(characters.indices,id: \.self){index in
                    Image(characters[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            let color: Color = (scheme == .dark ? .black : .white)
            // Custom Gradient
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color
            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
