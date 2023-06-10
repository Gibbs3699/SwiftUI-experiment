//
//  CharactersImageService.swift
//  Game Characters
//
//  Created by TheGIZzz on 10/6/2566 BE.
//

import Foundation
import SwiftUI
import Combine

class CharactersImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private var characters: ChampionElement
    private var imageName: String
    
    init(characters: ChampionElement) {
        self.characters = characters
        self.imageName = characters.node.champion.profileImage?.url ?? "questionmark"
        donwloadCoinImage()
    }
    
    private func donwloadCoinImage() {
        guard let url = URL(string: characters.node.url) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
            })
    }
}
