//
//  ListDataSource.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/4/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import Foundation

class ListDataSource {
    
    static func getAnimations() -> [Animation] {
        let animations = [Animation(name: "Breath - Brain", file: "breath_brain", presenter: .slider),
                          Animation(name: "Vertical Arrow", file: "arrow_vertical")]
        
        return animations
    }
}


