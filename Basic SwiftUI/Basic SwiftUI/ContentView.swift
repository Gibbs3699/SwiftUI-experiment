//
//  ContentView.swift
//  Basic SwiftUI
//
//  Created by TheGIZzz on 13/9/2565 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Text("second view"),
                    label: {
                        ButtonConnten(title: "Tap")
                    }
                )
            }
            .navigationTitle("Test")
        }
    }
}

struct ButtonConnten: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 24))
            .bold()
            .foregroundColor(.green)

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
