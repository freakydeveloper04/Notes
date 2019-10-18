//
//  SignUpVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 16/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailTextFIeld: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFIeld.delegate = self
        passwordTextField.delegate = self
        
        emailTextFIeld.text = ""
        passwordTextField.text = ""
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //MARK:- DIRECT TO HOMEPAGE IF ALREADY LOGGED IN
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{

            self.performSegue(withIdentifier: "home", sender: self)
        }
    }
    
    @IBAction func signupButton(_ sender: UIButton) {
        
        guard let email = emailTextFIeld.text else {return}
        guard let password = passwordTextField.text else {return}
        
        //MARK:- FIREBASE AUTHENTICATION
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created!")

                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homescreen") as! ContainerVC
                self.present(nextViewController, animated:true, completion:nil)

            }
                
            else {
                let alert = UIAlertController(title: "Alert", message: "Error: \(error!.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                print("Error: \(error!.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginVC
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    //MARK:- KEYBOARD
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
