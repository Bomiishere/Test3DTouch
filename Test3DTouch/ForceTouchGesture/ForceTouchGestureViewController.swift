//
//  ViewController.swift
//  Test3DTouch
//
//  Created by bomi.chen on 2020/9/8.
//  Copyright © 2020 JohnsonTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
    lazy var forceTouchGestureRecognizer = ForceTouchGestureRecognizer(target: self, action: #selector(forceTouchHandler))
    
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
        label.text = "1.6.10.20090701"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.setupView()
        
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            threeDTouchView.addGestureRecognizer(forceTouchGestureRecognizer)
        } else  {
            // When force touch is not available, remove force touch gesture recognizer.
            // Also implement a fallback if necessary (e.g. a long press gesture recognizer)
            threeDTouchView.removeGestureRecognizer(forceTouchGestureRecognizer)
        }
    }
    
    @objc func tapHandler(_ sender: UITapGestureRecognizer) {
        print("Tap triggered")
    }

    @objc func forceTouchHandler(_ gesture: ForceTouchGestureRecognizer) {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        print("Force touch triggered")
//
        if gesture.state == .began {
            print("Force touch triggered")
        } else if gesture.state == .ended {
            print("Force touch triggered end")
        }
    }

    private func setupView() {
        
        threeDTouchView.addGestureRecognizer(self.tapGestureRecognizer)
        touchViewTitleLabel.isHidden = true
        
        //add view
        self.view.addSubview(threeDTouchView)
        
        threeDTouchView.translatesAutoresizingMaskIntoConstraints = false
        threeDTouchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        threeDTouchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        threeDTouchView.widthAnchor.constraint(equalTo: threeDTouchView.heightAnchor).isActive = true
        threeDTouchView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //add touch view
        self.threeDTouchView.addSubview(touchViewTitleLabel)
        
        touchViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        touchViewTitleLabel.centerYAnchor.constraint(equalTo: threeDTouchView.centerYAnchor).isActive = true
        touchViewTitleLabel.centerXAnchor.constraint(equalTo: threeDTouchView.centerXAnchor).isActive = true
    }

}
