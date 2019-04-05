//
//  ListDataSource.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/4/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import Foundation

class ListDataSource {
    
    static func getAnimations() -> [AnimationInfo] {
        let animations = [AnimationInfo(name: "Breath - Brain", file: "breath_brain", presenter: .slider),
                          AnimationInfo(name: "Vertical Arrow", file: "arrow_vertical")]
        
        return animations
    }
}


