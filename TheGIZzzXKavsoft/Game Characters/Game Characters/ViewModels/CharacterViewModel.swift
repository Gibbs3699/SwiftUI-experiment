//
//  CharacterViewModel.swift
//  Game Characters
//
//  Created by TheGIZzz on 7/6/2566 BE.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    @Published var allCharacters: [String : CharactersModel] = [:]
    
    private var charactersDataService = CharactersDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        charactersDataService.$allCharacters
            .sink { [weak self] (returnedCharacters) in
                guard let self = self else { return }
                self.allCharacters = returnedCharacters
            }
            .store(in: &cancellable)
    }
}
