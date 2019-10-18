//
//  AddNoteVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit
import FirebaseFirestore

class AddNoteVC: UIViewController{

    let imagePicker = UIImagePickerController()
    var selectedImage: UIImage?
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        self.setupImagePicker()
    }
 
    @IBAction func saveButton(_ sender: Any) {
        self.saveFIRData()
    }
    
    func saveFIRData(){
        
        let title = titleTextField.text
        let description = descriptionTextView.text
        
        let dict: [String: Any] = ["title": title as Any,
                                   "description": description as Any]
        
        let db = Firestore.firestore()
        db.collection("notes").document().setData(dict)
        
        
        let alert = UIAlertController(title: "Upload", message: "Uploaded Successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "DONE", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- KEYBOARD
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
