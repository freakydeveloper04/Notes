
//
//  Model.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol DocumentSerializable  {
    init?(dictionary:[String:Any])
}

struct Model {
    var title:String
    var description:String
    
    var dictionary:[String:Any] {
        return [
            "title" : title,
            "description" : description,
        ]
    }
    
}

extension Model : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String else {return nil}
        
        self.init(title: title, description: description)
    }
}


