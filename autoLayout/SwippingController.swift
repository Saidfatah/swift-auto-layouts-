//
//  SwippingController.swift
//  autoLayout
//
//  Created by said fatah on 3/4/2022.
//

import UIKit



class SwippingController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    let pages = [
    Page(imageName: "bear_first", headerTitle: "Hey you",description: "do you want to make 1 milion dollars in one year ?"),
    Page(imageName: "heart_second", headerTitle: "Yeah you",description: " do you want to become rich so quick "),
    Page(imageName: "leaf_third", headerTitle: "Yeah you dumbass",description: " you can get rich so quick jeezz hahahha your so dumb man !"),
    Page(imageName: "leaf_third", headerTitle: "Yeah you dumbass",description: " you can get rich so quick jeezz hahahha your so dumb man !"),
    Page(imageName: "leaf_third", headerTitle: "Yeah you dumbass",description: " you can get rich so quick jeezz hahahha your so dumb man !")


    ]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBottomControls()
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
  
    }
    
    fileprivate func setupBottomControls(){
        pageControl.widthAnchor.constraint(equalToConstant: 300)
        let bottomControlsStackView = UIStackView(arrangedSubviews: [
           previousButton,
           pageControl,
           nextButton
        ])
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomControlsStackView)
      
        
        NSLayoutConstraint.activate(
            [
                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
                bottomControlsStackView.widthAnchor.constraint(equalToConstant: 50),
            ]
        )
    }
    private let previousButton : UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .focused)
        button.addTarget(self,action:#selector(handlePrev),for:.touchUpInside)
       return button
    }()
    
    @objc private func handlePrev(){
        //let prevIndex = pageControl.currentPage  > 0 ?pageControl.currentPage - 1  : 0
        let prevIndex = max(pageControl.currentPage - 1, 0)
        ScrollToIndex(index : prevIndex,isIndecatorTouch:false)
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self,action:#selector(hanldeNext),for:.touchUpInside)
       return button
    }()
    @objc private func hanldeNext(){
        //let nextIndex = pageControl.currentPage  < pages.count - 1  ?pageControl.currentPage + 1  : pages.count - 1
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        ScrollToIndex(index : nextIndex,isIndecatorTouch:false)
       
    }
    
    private func ScrollToIndex(index :Int,isIndecatorTouch : Bool){
        if(!isIndecatorTouch){
            pageControl.currentPage = index
        }

        let rect = collectionView.layoutAttributesForItem(at:IndexPath(row: index , section: 0))?.frame
        collectionView.scrollRectToVisible(rect!, animated: true)
        //collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl:UIPageControl = {
        let pc = UIPageControl()
        pc.addTarget(self, action: #selector(pageControlSelectionAction), for: .touchUpInside)
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .mainPinkFainted
        pc.currentPageIndicatorTintColor = .mainPink
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pc.backgroundStyle = .minimal
        return pc
    }()
    @objc func pageControlSelectionAction(_ sender: UIPageControl) {
        let page: Int? = sender.currentPage
        print(sender.currentPage)
        ScrollToIndex(index : page!,isIndecatorTouch : true)
   }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
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
