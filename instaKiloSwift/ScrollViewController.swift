//
//  ScrollViewController.swift
//  instaKiloSwift
//
//  Created by Spencer Symington on 2019-01-28.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {
  @IBOutlet weak var bigImage: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var imageNameField: UITextField!
  @IBOutlet weak var imageCategoryField: UITextField!
  
  @IBOutlet weak var modeButton: UIButton!
  var editMode = false
  
  var indexPath :IndexPath?
  
var imageDataToLoad :ImageData?
  
    override func viewDidLoad() {
      super.viewDidLoad()
      scrollView.delegate = self
      
      bigImage.image = imageDataToLoad?.image
      imageCategoryField.text = imageDataToLoad?.category
      imageNameField.text = imageDataToLoad?.name
      
      editMode = false
      imageNameField.borderStyle = UITextField.BorderStyle.none
      imageCategoryField.borderStyle = UITextField.BorderStyle.none
    }
  @IBAction func switchMode(_ sender: Any) {
    //switches from edit to save mode
    
    if editMode == false {
      editMode = true
      //switch to edit mode
      modeButton.setTitle("save",for: .normal)
      imageCategoryField.isUserInteractionEnabled = true
      imageNameField.isUserInteractionEnabled = true
      
      
      imageNameField.borderStyle = UITextField.BorderStyle.roundedRect
      imageCategoryField.borderStyle = UITextField.BorderStyle.roundedRect
      
    }else{
      //save the data and switch back
      editMode = false
      modeButton.setTitle("edit",for: .normal)
      
      print("image data saved")
      imageDataToLoad!.name = imageNameField.text!
      imageDataToLoad!.category = imageCategoryField.text!
      
      imageNameField.borderStyle = UITextField.BorderStyle.none
      imageCategoryField.borderStyle = UITextField.BorderStyle.none
      
      
    }
  }
  
  
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return bigImage
  }
  

}

