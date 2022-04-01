//
//  ViewController.swift
//  autoLayout
//
//  Created by said fatah on 1/4/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView:UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "horse"))
        //enable auto layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTitleTextView:UITextView = {
        let textView = UITextView()
        textView.text = "hey this is teh first slide"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        //enable auto layout
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let descriptionBodyTextView:UITextView = {
        let textView = UITextView()
        textView.text = "description description description description description description description description description description description description description description description description description "
        textView.font?.withSize(16)
        textView.textAlignment = .center
        //enable auto layout
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    // avoid polluting view load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.addSubview(descriptionTitleTextView)
        view.addSubview(descriptionBodyTextView)
        setupLoayout()
        
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
        
        // title
        descriptionTitleTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor,constant: 100).isActive = true
        descriptionTitleTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTitleTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTitleTextView.bottomAnchor.constraint(equalTo: descriptionBodyTextView.topAnchor).isActive = true
        
        // body
        descriptionBodyTextView.topAnchor.constraint(equalTo: descriptionTitleTextView.bottomAnchor,constant: 50).isActive = true
        descriptionBodyTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionBodyTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionBodyTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}

