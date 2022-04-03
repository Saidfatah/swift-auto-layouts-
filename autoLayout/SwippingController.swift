//
//  SwippingController.swift
//  autoLayout
//
//  Created by said fatah on 3/4/2022.
//

import UIKit



class SwippingController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    let pages = [
    Page(imageName: "bear_first", headerTitle: "title 1",description: "description 1"),
    Page(imageName: "heart_second", headerTitle: "title 2",description: "description 2"),
    Page(imageName: "leaf_third", headerTitle: "title 3",description: "description 3")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
  
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
        // the ctrollers role is to cordinate between the model and the view
        // so its just needs to pass in the data to the view
        //cell.bearImageView.image = UIImage(named : page.imageName)
        //cell.descriptionTextView.text = page.headerTitle
       // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .black
         
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
