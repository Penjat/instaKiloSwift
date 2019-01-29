//
//  ImageDataManager.swift
//  instaKiloSwift
//
//  Created by Spencer Symington on 2019-01-28.
//  Copyright © 2019 Spencer Symington. All rights reserved.
//

import UIKit

enum SortMode{
  case all,category
}


class ImageDataManager{
  
  static let shared = ImageDataManager()
  
  var imageDataArray :[ImageData] = [ImageData]() //contains all the image data
  var sectionArray :[Section] = [Section]() //orginized by section
  var sortMode = SortMode.all
  
    
  
    
  init(){}
  
  
  func addImage(path :String , category :String){
    if let tele = UIImage.init(named: path){
      
      let imageData = ImageData(image: tele,name:path ,category :category)
      imageDataArray.append(imageData)
    }
  }
  func removeData(index : Int){
    
    imageDataArray.remove(at: index)
    switch (sortMode){
      
    case .all:
      showAll()
    case .category:
      sortByCategory()
    }
    
  }
  
  func showAll(){
    print("showing all")
    sectionArray.removeAll()
    sectionArray.append(Section (name: "All Image",array: imageDataArray))
    sortMode = SortMode.all
  }
  
  func sortByCategory(){
    print("sorting by category")
    sectionArray.removeAll()
    
    //cycle through all the images
    for imageData in imageDataArray{
      
      var wasAdded = false
      for section in sectionArray{
        if section.sectionName == imageData.category{
          section.sectionElements.append(imageData)
          wasAdded = true
        }
      }
      //if we go through all the sections without adding, create new section
      //and add image data
      if wasAdded == false {
        let section = Section(name: imageData.category, array: [imageData])
        sectionArray.append(section)
      }
    }
    print("section count = \(sectionArray.count)")
    sortMode = SortMode.category
  }
  
  func getHeaderTitle(index:Int) -> String{
    //TODO update for different tags
    return sectionArray[index].sectionName
  }
  func getData(indexPath: IndexPath) -> ImageData{
    //TODO clean this up
    return sectionArray[indexPath.section].sectionElements[indexPath.row]
  }
  
}

class Section {
  var sectionName :String
  var sectionElements :[ImageData]
  
  init(name :String , array :[ImageData] ) {
    sectionName = name
    sectionElements = array
  }
}

