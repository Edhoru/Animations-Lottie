//
//  Animation.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/4/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import Foundation

enum Presenter {
    case slider
    case base
}

struct AnimationInfo {
    let name: String
    let file: String
    let presenter: Presenter
    
    init(name: String, file: String, presenter: Presenter = .base) {
        self.name = name
        self.file = file
        self.presenter = presenter
    }
}
