//
//  ListViewController.swift
//  Animations-Lottie
//
//  Created by Alberto Huerdo on 4/4/19.
//  Copyright © 2019 huerdo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    //Properties
    var animations: [AnimationInfo] = []
    
    //UI
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.animations = ListDataSource.getAnimations()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupUI() {
        self.title = "Animations"
        self.view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        setupProperties()
    }
    
    private func setupProperties() {
        animations = ListDataSource.getAnimations()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
}


extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let animation = animations[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollectionViewCell
        cell.setup(title: animation.name)
        return cell
    }
    
}


extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let animation = animations[indexPath.row]
        switch animation.presenter {
        case .base:
            let buttonViewController = ButtonViewController(animationInfo: animation)
            self.navigationController?.pushViewController(buttonViewController, animated: true)
        case .slider:
            let sliderViewController = SliderViewController(animation: animation)
            self.navigationController?.pushViewController(sliderViewController, animated: true)
        }
    }
    
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 52)
    }
    
}
