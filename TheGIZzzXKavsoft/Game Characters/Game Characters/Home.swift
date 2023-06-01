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
    @State var showDetailView: Bool = false
    @State var detailCharacter: Characters?
    @State var currentCardSize: CGSize = .zero
    
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    var categories: [String] = ["Films","Localities"]
    
    var body: some View {
        ZStack {
            backgroundView()
            
            VStack {
                
                navigationBar()
                
                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: characters) { character in
                    
                    GeometryReader { proxy in
                       
                        let size = proxy.size
                        
                        Image(character.artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: character.id, in: animation)
                            .onTapGesture {
                                currentCardSize = size
                                detailCharacter = character
                                withAnimation {
                                    showDetailView.toggle()
                                }
                            }
                        
                    }
                }
                .padding(.top, 70)
                
                customIndicator()
                
                HStack{
                    Text("Popular")
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    Button("See More"){}
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(characters) { character in
                            Image(character.artwork)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 120)
                                .cornerRadius(15)
                            
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    func customIndicator()-> some View {
        HStack {
            ForEach(characters.indices ,id: \.self){ index in
                Circle()
                    .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
            }
            .animation(.easeInOut, value: currentIndex)
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
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color
            ], startPoint: .top, endPoint: .bottom)
            
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
