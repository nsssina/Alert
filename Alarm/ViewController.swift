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
    
    // MARK: - Configure view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true;
    }
    
    @IBAction func addAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            print("added")
        }
        alertController.addTextField { (textField) in
            print(textField.text!)
        }
        alertController.addAction(addAction)
        present(alertController, animated: true)
    }
}

// MARK: - Configure collection view

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mainCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath)
        mainCell.backgroundColor = .systemRed
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
