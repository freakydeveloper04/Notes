
//
//  HomeVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 16/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeVC: UIViewController {
    
    var arrData = [Model]()
    var db:Firestore!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()

        NotificationCenter.default.addObserver(self, selector: #selector(showAccount), name: NSNotification.Name("ShowAccount"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showProfile), name: NSNotification.Name("ShowProfile"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showLocation), name: NSNotification.Name("ShowLocation"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMail), name: NSNotification.Name("ShowMail"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showLogout), name: NSNotification.Name("ShowLogout"), object: nil)
    }
    
    // MARK:- SIDE MENU
    
    @objc func showAccount(){
        
        performSegue(withIdentifier: "ShowAccount", sender: nil)
    }
    @objc func showProfile(){
        
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    @objc func showLocation(){
        
        performSegue(withIdentifier: "ShowLocation", sender: nil)
    }
    @objc func showMail(){
        
        performSegue(withIdentifier: "ShowMail", sender: nil)
    }
    @objc func showLogout(){
        
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func onDashTapped(){
        print("TOGGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
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
                    self.tableView.reloadData()
                    }
                }
            }
        }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notecell", for: indexPath)
        
        let notee = arrData[indexPath.row]
        
        //cell.lblTitle.text = "\(note.title)"
            cell.textLabel?.text = "\(notee.title)"
        //cell.textLabel?.text = "NAME : \(sell.name)   PRICE: \(sell.price)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "viewnote") as! ViewNoteVC
        self.present(nextViewController, animated:true)
    }
}
