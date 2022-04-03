//
//  SwippingController.swift
//  autoLayout
//
//  Created by said fatah on 3/4/2022.
//

import UIKit

class SwippingController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
  
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
       // cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .black
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
