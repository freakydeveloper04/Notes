//
//  NotesCellTC.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import UIKit

class NotesCellTC: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    var model: Model?{
        
        didSet{
            
            lblTitle.text = model?.title
        }
    }
}
