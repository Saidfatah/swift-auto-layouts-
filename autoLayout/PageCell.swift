//
//  PageCell.swift
//  autoLayout
//
//  Created by said fatah on 3/4/2022.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    var page : Page? {
        didSet{
            guard let unwrappedPage = page else {return}
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedString = NSMutableAttributedString(string:unwrappedPage.headerTitle, attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
                NSAttributedString.Key.strokeColor : UIColor.blue
            ]
            )
            
            attributedString.append(NSAttributedString(string:"\n\n\n\(unwrappedPage.description)",
                attributes: [
                   NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
                   NSAttributedString.Key.foregroundColor : UIColor.gray
               ]
            ))
            descriptionTextView.attributedText = attributedString
            descriptionTextView.textAlignment = .center
        }
    }
    private let bearImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "horse"))
        //enable auto layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let descriptionTextView:UITextView = {
        let textView = UITextView()
        //textView.text = "hey this is teh first slide"
        //textView.font = UIFont.boldSystemFont(ofSize: 18)
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

