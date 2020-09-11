//
//  PreviewViewController.swift
//  Test3DTouch
//
//  Created by bomi.chen on 2020/9/9.
//  Copyright © 2020 JohnsonTech. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, ViewControllerPreviewable {
    
    var is3DTouchPreview: Bool = false
    
    let versionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9, weight: UIFont.Weight.medium)
        label.text = "1.6.10.20090701"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //show view at different circumstance
        if is3DTouchPreview {
            
        } else {
            
        }
        
        self.view.backgroundColor = .systemYellow
        
        self.view.addSubview(versionLabel)
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        versionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
