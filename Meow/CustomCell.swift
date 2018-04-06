//
//  CustomCell.swift
//  Meow
//
//  Created by Amith Dubbasi on 4/5/18.
//  Copyright © 2018 iDiscover. All rights reserved.
//

import UIKit

class CustomCell : UICollectionViewCell
{
    var post : Post?{
        didSet{
            guard let postImageUrl = post?.image_url else{return}
            meowImageView.loadImage(imageUrl: postImageUrl)
            meowLabel.text = post?.title
            dateLabel.text = post?.timestamp
            descr.text = post?.description
            
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dateLabel)
        addSubview(meowImageView)
        addSubview(meowLabel)
        addSubview(descr)
        
       
         dateLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: -5, width: 0, height: 0)
    
        meowImageView.anchor(top: dateLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: -5, width: 0, height: 0)
        meowLabel.anchor(top: meowImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: -5, width: 0, height: 0)
         descr.anchor(top: meowLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: -5, paddingRight: -5, width: 0, height: 0)
        
    }
    
    var meowLabel : UILabel = {
        let label = UILabel()
        label.text = "dummy"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    var dateLabel : UILabel = {
        let label = UILabel()
        label.text = "dummy"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    var descr : UILabel = {
        let label = UILabel()
        label.text = "dummy"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    
    
    var meowImageView : CustomImage = {
        let imv = CustomImage()
        imv.image = UIImage(named: "gear")
        imv.backgroundColor = UIColor.lightGray
        imv.contentMode = .scaleAspectFill
        imv.clipsToBounds =  true
        return imv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?,left : NSLayoutXAxisAnchor?,bottom : NSLayoutYAxisAnchor?, right : NSLayoutXAxisAnchor?, paddingTop : CGFloat?,paddingLeft : CGFloat?,paddingBottom : CGFloat?, paddingRight : CGFloat?, width : CGFloat,height : CGFloat){
        
        //Applies to every constraint calling this function
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top, let paddingTop =  paddingTop{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left, let paddingLeft = paddingLeft{
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right, let paddingRight = paddingRight {
            self.rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if let bottom = bottom, let paddingBottom = paddingBottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
}
