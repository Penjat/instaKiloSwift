//
//  ViewController.swift
//  instaKiloSwift
//
//  Created by Spencer Symington on 2019-01-28.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate {
  
  
  @IBOutlet weak var myCollectionView: UICollectionView!
  var myImageArray:[UIImage] = [UIImage]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myCollectionView.dataSource = self
    
    if let tele = UIImage.init(named: "tele"){
      myImageArray.append(tele)
    }
    if let tele = UIImage.init(named: "tele2"){
      myImageArray.append(tele)
    }
    if let tele = UIImage.init(named: "tele3"){
      myImageArray.append(tele)
    }
    if let tele = UIImage.init(named: "tele4"){
      myImageArray.append(tele)
    }
    if let tele = UIImage.init(named: "tele5"){
      myImageArray.append(tele)
    }
    
//    myImageArray.append(UIImage.init(named: "tele2"))
//    myImageArray.append(UIImage.init(named: "tele3"))
//    myImageArray.append(UIImage.init(named: "tele4"))
//    myImageArray.append(UIImage.init(named: "tele5"))
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //TODO check for section
    return myImageArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    var cell :ImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
    
    cell.setUpCell(image:myImageArray[indexPath.row])
    
    
    return cell
  }


}

