//
//  AnimationViewController.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/8/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import UIKit
import Lottie

//This is the base view controller for standalone animations

class AnimationViewController: UIViewController {
    
    //Properties
    var animationInfo: AnimationInfo
    
    //UI
    var animationView: AnimationView = {
        let animationView = AnimationView(frame: .zero)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    
    init(animationInfo: AnimationInfo) {
        self.animationInfo = animationInfo
        
        super.init(nibName: nil, bundle: nil)
        
        let animation = Animation.named(animationInfo.file)
        animationView.animation = animation
        animationView.animationSpeed = animationInfo.speed
        animationView.loopMode = animationInfo.loop
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animationAction))
        animationView.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
    
    //Action
    @objc func animationAction() {
        print("animation action")
    }

}
