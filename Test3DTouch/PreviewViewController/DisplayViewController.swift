//
//  DisplayViewController.swift
//  Test3DTouch
//
//  Created by bomi.chen on 2020/9/9.
//  Copyright © 2020 JohnsonTech. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let threeDTouchView: UIView = {
        let touchView = UIView()
        let float: CGFloat = 231/255
        touchView.backgroundColor = UIColor(displayP3Red: float, green: float, blue: float, alpha: 0.95)
        touchView.layer.masksToBounds = true
        touchView.layer.cornerRadius = 8.0
        return touchView
    }()
    
    //register for preview view
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
          super.traitCollectionDidChange(previousTraitCollection)
          if traitCollection.forceTouchCapability == .available {
              //TableView:
              registerForPreviewing(with: self, sourceView: self.threeDTouchView)
              //CollectionView:
//              registerForPreviewing(with: self, sourceView: self.CollectionView)
          }
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension DisplayViewController: UIViewControllerPreviewingDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            self.tableView.indexPath(for: cell)
            
        }
    }
    
    //3D Touch放開後，要做的處理
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        //現在要直接跳轉的該頁面了，所以將ViewController的預覽模式參數取消：
        if var viewControllerToCommit = viewControllerToCommit as? ViewControllerPreviewable {
            viewControllerToCommit.is3DTouchPreview = false
        }
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }
    
    //控制3D Touch的Cell位置，欲顯示的ViewController
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        //取得當前點的indexPath/cell實體
        //TableView:
//        guard let indexPath = self.tableView.indexPathForRow(at: location),let cell = self.tableView.cellForRow(at: indexPath) else { return nil }
        //CollectionView:
//        guard let indexPath = CollectionView.indexPathForItem(at: location),let cell = CollectionView.cellForItem(at: indexPath) else { return nil }
      
        //欲顯示的ViewController
        
//        let targetViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreviewViewController")
        let targetViewController = PreviewViewController()

        //背景虛化時保留區域(一般為點擊位置)，附圖1
        previewingContext.sourceRect = threeDTouchView.frame
        
        //3D Touch視窗大小，預設為自適應，不需更改
        targetViewController.preferredContentSize = CGSize(width: self.view.frame.width, height: 50)
        
        //告知預覽的ViewController目前為預覽模式：
        if var targetViewController = targetViewController as? ViewControllerPreviewable {
            targetViewController.is3DTouchPreview = true
            print("123")
        }
        
        //回傳nil則無任何作用
        return targetViewController
    }
}

extension DisplayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            let cellView = self.createCellView()
            cell.contentView.addSubview(cellView)
            cellView.translatesAutoresizingMaskIntoConstraints = false
            cellView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            cellView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            cellView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            cellView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            return cell
        }
        return cell
    }
}

// private method
extension DisplayViewController {
    private func setupView() {
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(tableView)
//        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.view.backgroundColor = .systemBlue
        
        self.view.addSubview(threeDTouchView)
        threeDTouchView.translatesAutoresizingMaskIntoConstraints = false
        threeDTouchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        threeDTouchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        threeDTouchView.widthAnchor.constraint(equalTo: threeDTouchView.heightAnchor, multiplier: 1.85).isActive = true
        threeDTouchView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func createCellView() -> UIView {
        let touchView = UIView()
        let float: CGFloat = 231/255
        touchView.backgroundColor = UIColor(displayP3Red: float, green: float, blue: float, alpha: 0.95)
        touchView.layer.masksToBounds = true
        touchView.layer.cornerRadius = 8.0
        return touchView
    }
}
