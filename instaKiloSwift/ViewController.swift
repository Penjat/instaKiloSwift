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
  var deleteMode = false
//  var imageDataManager  = ImageDataManager()
  //var myImageArray:[ImageData] = [ImageData]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myCollectionView.dataSource = self
    myCollectionView.delegate = self
    
    ImageDataManager.shared.addImage(path:"tele",category: "tele")
    ImageDataManager.shared.addImage(path:"tele2",category: "tele")
    ImageDataManager.shared.addImage(path:"tele3",category: "tele")
    ImageDataManager.shared.addImage(path:"tele4",category: "tele")
    ImageDataManager.shared.addImage(path:"tele5",category: "tele")
    ImageDataManager.shared.addImage(path:"notTele1",category: "not tele")
    ImageDataManager.shared.addImage(path:"notTele2",category: "not tele")
    ImageDataManager.shared.addImage(path:"notTele3",category: "not tele")
    ImageDataManager.shared.addImage(path:"notTele4",category: "not tele")
    ImageDataManager.shared.addImage(path:"notTele5",category: "not tele")
    ImageDataManager.shared.addImage(path:"gibson",category: "not tele")
    ImageDataManager.shared.addImage(path:"gibson2",category: "not tele")
    ImageDataManager.shared.addImage(path:"gibson3",category: "not tele")
    ImageDataManager.shared.addImage(path:"gibson5",category: "not tele")
    
    self.title = ""
    deleteMode = false
    ImageDataManager.shared.showAll()
    setUpLayout()
  }
  @IBAction func toggleDeleteMode(_ sender: Any) {
    if deleteMode {
      deleteMode = false
      self.title = ""
    }else{
      deleteMode = true
      self.title = "delete mode on"
    }
    
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    ImageDataManager.shared.showAll()
    myCollectionView.reloadData()
    deleteMode = false
    self.title = ""
  }
  
  func setUpLayout(){
    let myLayout = UICollectionViewFlowLayout();
    myLayout.itemSize = CGSize(width: 120, height: 120)
    myLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    myLayout.minimumLineSpacing = 5;
    myLayout.minimumInteritemSpacing = 5;
    myLayout.headerReferenceSize = CGSize(width: 10, height: 50 );
    
    myCollectionView.collectionViewLayout = myLayout;
  }
  
  @IBAction func showAll(_ sender: Any) {
    ImageDataManager.shared.showAll()
    myCollectionView.reloadData()
  }
  @IBAction func sortByTag(_ sender: Any) {
    ImageDataManager.shared.sortByCategory()
    myCollectionView.reloadData()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //TODO check for section
    return ImageDataManager.shared.sectionArray[section].sectionElements.count
  }
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
    
    if kind == UICollectionView.elementKindSectionHeader{
      let header :HeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! HeaderView
      header.headerLabel.text = ImageDataManager.shared.getHeaderTitle(index: indexPath.section)
      
      return header
    }
    return UICollectionReusableView()
    
    
  }
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return ImageDataManager.shared.sectionArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    if(deleteMode){
      ImageDataManager.shared.removeData(index: indexPath.row)
      myCollectionView.reloadData()
      return false
    }
    
    print("selecting item")
    performSegue(withIdentifier: "toScroll", sender: indexPath)
    return true
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    let indexPath = sender as! IndexPath
    let scrollController = segue.destination as! ScrollViewController
    
    scrollController.imageDataToLoad = ImageDataManager.shared.getData(indexPath: indexPath)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell :ImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
    
    cell.setUpCell(data: ImageDataManager.shared.getData(indexPath: indexPath))
    
    
    return cell
  }


}

