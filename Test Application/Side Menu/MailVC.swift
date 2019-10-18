//
//  MailVC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit
import MessageUI

class MailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func sendmailDev(_ sender: Any) {
        
        self.showMailComposer()
    }
    @IBAction func sendmailOther(_ sender: Any) {
        
        self.showMailComposers()
    }
    
    func showMailComposer(){
        
        guard MFMailComposeViewController.canSendMail()  else{
            
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        composer.setToRecipients(["help@picker.com"])
        composer.setSubject("Help")
        composer.setMessageBody("This is a test mail. Do not reply", isHTML: false)
        
        present(composer, animated: true)
    }
    func showMailComposers(){
        
        guard MFMailComposeViewController.canSendMail()  else{
            
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        composer.setToRecipients([""])
        composer.setSubject("")
        composer.setMessageBody("", isHTML: false)
        
        present(composer, animated: true)
    }
}
