//
//  ImageData.swift
//  instaKiloSwift
//
//  Created by Spencer Symington on 2019-01-28.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class ImageData{
  var image :UIImage
  var name :String
  var category :String
  
  init(image :UIImage, name :String, category:String ) {
    self.image = image
    self.name = name
    self.category = category
  }
  
  
}
