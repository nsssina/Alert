//
//  AddNewAlarmVC.swift
//  Alarm
//
//  Created by Sina Rabiei on 11/11/19.
//  Copyright © 2019 Sina Rabiei. All rights reserved.
//

import UIKit

class AddNewAlarmVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var addAlarmOut: UIButton!
    @IBOutlet weak var enterTextLbl: UILabel!
    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var selectedImageOut: UIImageView!
    @IBOutlet weak var addDataOut: UIButton!
    @IBOutlet weak var closeViewOut: UIButton!
    
    var imageArray = [UIImage]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
   
    @IBAction func addAlarmAct(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func addDataAct(_ sender: Any) {
        if textFieldOut.text != "" {
            appDelegate.textArray.append(textFieldOut.text!)
            NotificationCenter.default.post(name: Notification.Name("viewDismissed"), object: nil)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeViewAct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        var selectedImageFromPicker: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }

        if let selectedImage = selectedImageFromPicker {
            selectedImageOut.image = selectedImage
            appDelegate.imageArray.append(selectedImage)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
