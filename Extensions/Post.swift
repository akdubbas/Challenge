//
//  Post.swift
//  Meow
//
//  Created by Amith Dubbasi on 4/5/18.
//  Copyright © 2018 iDiscover. All rights reserved.
//

import Foundation
import UIKit

struct Post {
    let description : String
    let image_url : String
    let timestamp : String
    let title : String
    
    init(dictionary:[String : Any])
    {
        self.description = dictionary["description"] as? String ?? ""
        self.image_url = dictionary["image_url"] as? String ?? ""
        let dateString = dictionary["timestamp"] as? String ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatter.date(from: dateString)!
        dateFormatter.dateFormat = "MM/dd/YYYY"
        let time = dateFormatter.string(from: date)
        self.timestamp = time
        self.title = dictionary["title"] as? String ?? ""
        
    }
}
