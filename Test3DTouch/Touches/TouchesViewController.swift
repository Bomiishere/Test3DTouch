//
//  TestViewController.swift
//  Test3DTouch
//
//  Created by bomi.chen on 2020/9/8.
//  Copyright © 2020 JohnsonTech. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    let threeDTouchView: UIView = {
        let touchView = UIView()
        let float: CGFloat = 231/255
        touchView.backgroundColor = UIColor(displayP3Red: float, green: float, blue: float, alpha: 0.95)
        touchView.layer.masksToBounds = true
        touchView.layer.cornerRadius = 8.0
        return touchView
    }()
    
    let touchViewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight.medium)
        label.text = "1.6.10.20090701"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemYellow
        self.setupView()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        guard let touch = touches.first else { return }
//        let location = touch.location(in: threeDTouchView)

//        for card in allCards {
//            if card.view.frame.contains(location) {
                if view.traitCollection.forceTouchCapability == .available {
                    if touch.force == touch.maximumPossibleForce {
                        touchViewTitleLabel.isHidden = false
                    } else {
                        touchViewTitleLabel.isHidden = true
                    }
                }
//            }
//        }
    }
    
    private func setupView() {
        
        touchViewTitleLabel.isHidden = true
        
        //add view
        self.view.addSubview(threeDTouchView)
        
        threeDTouchView.translatesAutoresizingMaskIntoConstraints = false
        threeDTouchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        threeDTouchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        threeDTouchView.widthAnchor.constraint(equalTo: threeDTouchView.heightAnchor, multiplier: 1.85).isActive = true
        threeDTouchView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let imageView = UIImageView(image: UIImage(named: "demo_image"))
        imageView.contentMode = .scaleAspectFill
        threeDTouchView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: threeDTouchView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: threeDTouchView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: threeDTouchView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: threeDTouchView.trailingAnchor).isActive = true
        
        //add touch view
        self.threeDTouchView.addSubview(touchViewTitleLabel)
        
        touchViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        touchViewTitleLabel.trailingAnchor.constraint(equalTo: threeDTouchView.trailingAnchor, constant: -6).isActive = true
        touchViewTitleLabel.topAnchor.constraint(equalTo: threeDTouchView.topAnchor, constant: 6).isActive = true
//        touchViewTitleLabel.centerYAnchor.constraint(equalTo: threeDTouchView.centerYAnchor).isActive = true
//        touchViewTitleLabel.centerXAnchor.constraint(equalTo: threeDTouchView.centerXAnchor).isActive = true
    }
}
