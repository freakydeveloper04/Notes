//
//  WelcomeVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 16/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func continueButton(_ sender: UIButton) {
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "homescreen") as! LoginVC
//        self.present(nextViewController, animated:true, completion:nil)
    }
}
