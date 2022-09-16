//
//  HomeView.swift
//  Crypto
//
//  Created by TheGIZzz on 16/9/2565 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            // MARK: Sample UI
            HStack(spacing: 15) {
                Circle()
                    .fill(.red)
                    .aspectRatio(contentMode: .fit)
                .frame(minWidth: 50, maxWidth: 50)
                
                VStack(alignment: .leading, spacing: 10.0) {
                    Text("BITCOIN")
                        .font(.callout)
                    
                    Text("BTC")
                        .font(.callout)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // MARK: Custom Segmented Control
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
