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
    
    enum States: String {
        case great
        case good
        case meh
        case poor
        case rough
        
        init(_ value: Float) {
            switch value {
            case 0.0...0.20:
                self = .rough
            case 0.21...0.40:
                self = .poor
            case 0.41...0.60:
                self = .meh
            case 0.61...0.80:
                self = .good
            case 0.81...1.0:
                self = .great
            default:
                self = .meh
            }
        }
    }
    
    //Properties
    var animation: AnimationInfo
    
    //UI
    var animationView: AnimationView!
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Mentally I feel..."
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    var stateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 42)
        return label
    }()
    var slider: UISlider = {
        let slider = UISlider(frame: .zero)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        return slider
    }()
    
    
    init(animation: AnimationInfo) {
        self.animation = animation
        
        super.init(nibName: nil, bundle: nil)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
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
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        animationView = AnimationView(name: animation.file)
        animationView.currentTime = (animationView.animation?.duration ?? 0) / 2
        animationView.translatesAutoresizingMaskIntoConstraints = false        
        
        setState(slider.value)
        
        view.addSubview(titleLabel)
        view.addSubview(animationView)
        view.addSubview(slider)
        view.addSubview(stateLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            
            animationView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            animationView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            animationView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75),
            
            stateLabel.heightAnchor.constraint(equalToConstant: 50),
            stateLabel.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 50),
            stateLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stateLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
            
            slider.heightAnchor.constraint(equalToConstant: 50),
            slider.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 50),
            slider.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            slider.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
            slider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
    }
    
    
    //MARK: Actions
    
    @objc func animate() {
        animationView.play()
    }
    
    @objc func changeValue(_ sender: UISlider) {
        animationView.animationSpeed = 8.0
        
        let animationProgressTime = AnimationProgressTime(Double(1-sender.value) )
        animationView.play(toProgress: animationProgressTime)
        
        setState(sender.value)
    }
    
    func setState(_ value: Float) {
        let string = States(value).rawValue.uppercased()
        stateLabel.text = string
    }
    
}
