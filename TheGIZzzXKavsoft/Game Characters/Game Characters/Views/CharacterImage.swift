//
//  CharacterImage.swift
//  Game Characters
//
//  Created by TheGIZzz on 10/6/2566 BE.
//

import SwiftUI

struct CharacterImage: View {
    
    @StateObject var vm: CharacterImageViewModel
    
    init(character: ChampionElement) {
        _vm = StateObject(wrappedValue: CharacterImageViewModel(character: character))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

struct CharacterImage_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImage(character: dev.character)
    }
}
