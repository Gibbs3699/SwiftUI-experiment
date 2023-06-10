//
//  CharacterImageViewModel.swift
//  Game Characters
//
//  Created by TheGIZzz on 10/6/2566 BE.
//

import Foundation
import SwiftUI
import Combine

class CharacterImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var character: ChampionElement
    private var dataService: CharactersImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(character: ChampionElement) {
        self.character = character
        self.dataService = CharactersImageService(characters: character)
        self.addSubscribers()
        self.isLoading = false
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
