//
//  PageCell.swift
//  autoLayout
//
//  Created by said fatah on 3/4/2022.
//

import UIKit

class PageCell : UICollectionViewCell {
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
    
    override init(frame :CGRect) {
        super.init(frame: frame)
        
        addSubview(descriptionTextView)
        setupPageLayout()
        
    }
    
    private func setupPageLayout(){
        let topImageView = UIView()
        addSubview(topImageView)
        topImageView.addSubview(bearImageView)
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        topImageView.topAnchor.constraint(equalTo:  topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor,multiplier: 0.5).isActive = true
      
        topImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        // description
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor,constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor,constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

