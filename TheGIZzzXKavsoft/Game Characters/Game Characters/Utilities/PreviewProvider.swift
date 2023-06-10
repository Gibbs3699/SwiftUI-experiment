//
//  PreviewProvider.swift
//  Game Characters
//
//  Created by TheGIZzz on 9/6/2566 BE.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    let homeVM = CharacterViewModel()
    
    private init() { }
    
    let character = ChampionElement(node: Node(
            publishDetails: PublishDetails(locale: .enUs)
            , uid: "bltf1c826326a26cd46", url: "/champions/aatrox/", championName: "Aatrox", championSplash: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_0.jpg", recommendedRoles: ["recommended_roles"], difficulty: 4, champion: NodeChampion(profileImage: ProfileImage(url: "https://images.contentstack.io/v3/assets/blt731acb42bb3d1659/blt570145160dd39dca/5db05fa8347d1c6baa57be25/RiotX_ChampionList_aatrox.jpg"))))
}
