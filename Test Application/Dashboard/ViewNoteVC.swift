//
//  ViewNoteVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ViewNoteVC: UIViewController {

    
    @IBOutlet weak var titleTextFieldN: UITextField!
    @IBOutlet weak var descTextFieldN: UITextView!
    @IBOutlet weak var imageViewN: UIImageView!
    
    var arrData = [Model]()
    var db:Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextFieldN.isEnabled = false
        descTextFieldN.isEditable = false
        
//        guard let ti = titleTextFieldN.text else {return}
//        guard let de = descTextFieldN.text else {return}
        
        loadData()
    }
  
    func loadData() {
        let db = Firestore.firestore()
        
        db.collection("notes").getDocuments() { (snapshot, error) in
            
            self.arrData.removeAll()
            
            if let error = error {
                print("\(error.localizedDescription)")
            }
                
            else{
                
                for document in (snapshot?.documents)!{
                    
                    let title = document.data()["title"] as? String ?? ""
                    let description = document.data()["description"] as? String ?? ""
                    
                    self.arrData.append(Model(title: title, description: description))
                    
                    self.titleTextFieldN.text = title
                    self.descTextFieldN.text = description
                
                }
            }
        }
    }
    
    @IBAction func homeButton(_ sender: UIBarButtonItem) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homescreen") as! ContainerVC
        self.present(nextViewController, animated:true, completion:nil)

    }
    
}                               
