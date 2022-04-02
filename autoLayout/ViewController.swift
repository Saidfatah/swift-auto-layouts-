//
//  ViewController.swift
//  autoLayout
//
//  Created by said fatah on 1/4/2022.
//

import UIKit


extension UIColor{
    static var mainPink = UIColor(red: 233/255, green: 68/255, blue: 133/255, alpha: 1)
    static var mainPinkFainted = UIColor(red: 233/255, green: 68/255, blue: 133/255, alpha: 0.5)
}
class ViewController: UIViewController {
    
    let bearImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "horse"))
        //enable auto layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView:UITextView = {
        let textView = UITextView()
        //textView.text = "hey this is teh first slide"
        //textView.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedString = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.strokeColor : UIColor.blue
        ]
        )
        
        attributedString.append(NSAttributedString(string:"\n\n\ndescription yeah this is the description of slider 1description yeah this is the description of slider 1 description yeah this is the description of slider 1",
            attributes: [
               NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
               NSAttributedString.Key.foregroundColor : UIColor.gray
           ]
        ))
        
        textView.attributedText = attributedString
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let previousButton : UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Previous", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)

        button.setTitleColor(.gray, for: .focused)
       return button
    }()
    private let nextButton : UIButton = {
        let button = UIButton(type:.system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
       return button
    }()
    private let pageControl:UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .mainPinkFainted
        pc.currentPageIndicatorTintColor = .mainPink
        return pc
    }()
    
    // avoid polluting view load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(descriptionTextView)
        setupLoayout()
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls(){
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
                bottomControlsStackView.widthAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    private func setupLoayout() {
        let topImageView = UIView()
        view.addSubview(topImageView)
        topImageView.addSubview(bearImageView)
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor,multiplier: 0.5).isActive = true
      
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        // description
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor,constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}

