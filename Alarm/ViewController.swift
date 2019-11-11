//
//  ViewController.swift
//  Alarm
//
//  Created by Sina Rabiei on 11/9/19.
//  Copyright © 2019 Sina Rabiei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
      
    @IBOutlet weak var mainCvc: UICollectionView!
    @IBOutlet weak var addOut: UIBarButtonItem!
    
    // MARK: - Variables
    
    let alarmsArray = [String]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var textArrayData = UserDefaults.standard.array(forKey: "textArr")
    var imageArrayData = UserDefaults.standard.array(forKey: "imageArr")
    
    // MARK: - Configure view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        mainCvc.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadCollectionView), name: Notification.Name("viewDismissed"), object: nil)
    }
    
    @objc func reloadCollectionView() {
        mainCvc.reloadData()
        print(appDelegate.imageArray.count)
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        
    }
    
    func doTheThings(index: UIImage) {
        let data = UserDefaults.standard.array(forKey: "textArr")
        if data != nil {
            var mainData = data as! [UIImage]
            if mainData.contains(index) == false {
                mainData.append(index)
            }
            imageArrayData = mainData
            UserDefaults.standard.set(mainData, forKey: "textArr")
            mainCvc.reloadData()
        } else {
            imageArrayData = [index]
            UserDefaults.standard.set([index], forKey: "textArr")
            mainCvc.reloadData()
        }
    }
}

// MARK: - Configure collection view

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCollectionViewCell

        mainCell.collectionImageView.image = appDelegate.imageArray[indexPath.row]
        
        return mainCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (self.view.frame.width / 2) - 200
        let size = CGSize(width: width, height: width)
        return size
    }
}
