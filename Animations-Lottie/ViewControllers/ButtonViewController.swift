//
//  ButtonViewController.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/6/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import UIKit
import Lottie

class ButtonViewController: AnimationViewController {
    
    //Properties
    var active = false
    
    //UI
    var backView: UIView = {
        let uiView = UIView(frame: .zero)
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .lightGray
        return uiView
    }()
    var backTopConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(backView)
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: animationView.widthAnchor),
            animationView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            animationView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        backTopConstraint = backView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height)
        backTopConstraint.isActive = true
    }
    
    
    override func animationAction() {
        if animationInfo.file == "heart" {
            animationView.play()
        } else {
            if active == false {
                animationView.play(fromFrame: 0, toFrame: 8, loopMode: .none, completion: nil)
            } else {
                animationView.play(fromFrame: 8, toFrame: 16, loopMode: .none, completion: nil)
            }
            
            self.backTopConstraint.constant = self.active == false ? 0 : self.view.bounds.height
            let animationDuration = (animationView.animation?.duration ?? 0.6) / 3
            UIView.animate(withDuration: animationDuration) {
                self.view.layoutSubviews()
            }
            
            active = !active
        }
    }
}
