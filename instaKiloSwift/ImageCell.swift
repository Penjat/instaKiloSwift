//
//  ImageCell.swift
//  instaKiloSwift
//
//  Created by Spencer Symington on 2019-01-28.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
  
  @IBOutlet weak var myImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  func setUpCell(data:ImageData){
    myImageView.image = data.image
    nameLabel.text = data.name
  }
    
}
