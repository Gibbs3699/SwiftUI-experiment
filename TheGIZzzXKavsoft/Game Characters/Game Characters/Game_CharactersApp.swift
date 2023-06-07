//
//  Game_CharactersApp.swift
//  Game Characters
//
//  Created by TheGIZzz on 28/5/2566 BE.
//

import SwiftUI

@main
struct Game_CharactersApp: App {
    
    @StateObject private var vm = CharacterViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
