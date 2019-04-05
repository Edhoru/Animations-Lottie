//
//  SliderViewController.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/4/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import UIKit
import Lottie

class SliderViewController: UIViewController {
    
    //Properties
    var animation: AnimationInfo
    
    //UI
    var animationView: AnimationView!

    init(animation: AnimationInfo) {
        self.animation = animation
        
        super.init(nibName: nil, bundle: nil)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        animationView = AnimationView(name: animation.file)
        animationView.translatesAutoresizingMaskIntoConstraints = false

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animate))
        animationView.addGestureRecognizer(tapGesture)

        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            animationView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75),
            animationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

    
    @objc func animate() {
        animationView.play()
    }
}
