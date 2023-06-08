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
    
    let characterVM = CharacterViewModel()
    
    private init() { }
    
}
