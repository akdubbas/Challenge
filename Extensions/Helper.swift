//
//  Helper.swift
//  Meow
//
//  Created by Amith Dubbasi on 4/5/18.
//  Copyright © 2018 iDiscover. All rights reserved.
//

import UIKit

class CustomImage : UIImageView
{
    var lastStringUrl : String?
    
    func loadImage(imageUrl : String)
    {
        self.image = nil
        lastStringUrl = imageUrl
        
        guard let url = URL(string: imageUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                print(err)
            }
            if(url.absoluteString != self.lastStringUrl)
            {
                return
            }
            guard let imageData = data else {return}
            let photo = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.image = photo
            }
        
            
        }.resume()
        
        
    }
}
