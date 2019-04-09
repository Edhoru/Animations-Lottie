//
//  Animation.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/4/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import Foundation
import Lottie

enum Presenter {
    case slider
    case base
}

struct AnimationInfo {
    let name: String
    let file: String
    let presenter: Presenter
    let speed: CGFloat
    var loop: LottieLoopMode
    
    init(name: String, file: String, presenter: Presenter = .base, speed: CGFloat, loop: LottieLoopMode = .playOnce) {
        self.name = name
        self.file = file
        self.presenter = presenter
        self.speed = speed
        self.loop = loop
    }
    
}
