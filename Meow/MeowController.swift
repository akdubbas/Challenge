//
//  MeowController.swift
//  Meow
//
//  Created by Amith Dubbasi on 4/5/18.
//  Copyright © 2018 iDiscover. All rights reserved.
//

import UIKit

class MeowController : UICollectionViewController,UICollectionViewDelegateFlowLayout
{
    let cellId = "cellId"
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        //collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
        loadFromServer()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        cell.post = posts[indexPath.row]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: width)
    }
    func loadFromServer()
    {
        let urlString  = "https://chex-triplebyte.herokuapp.com/api/cats?page=0"
        guard let url = URL(string: urlString) else{return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                guard let str = String(data: data, encoding: String.Encoding.utf8) else {return}
                print(str) //JSONSerialization
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [Any]
                    print(json.count)
                    for item in json{
                        let post = Post(dictionary: item as! [String : Any])
                        self.posts.append(post)
                    }
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                } catch let error as NSError {
                    print(error)
                }
                
                
            }
            
            
            
        }.resume()
        
    }
    
}
