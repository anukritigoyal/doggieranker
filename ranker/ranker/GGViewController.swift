//
//  GGViewController.swift
//  ranker
//
//  Created by Gabe Bizar on 3/17/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit



class GGViewController: UIViewController {
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firstView)
        view.addSubview(secondView)
        firstView.addSubview(firstImage)
        secondView.addSubview(secondImage)
        setupMain()


        // Do any additional setup after loading the view.
    }
    var correctGuesses = 0
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
            
        }
        
    }
    
    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue

        return view
    }()
    
    let firstImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let secondImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    let singleTap = UITapGestureRecognizer(target: self, action: #selector(selected0))
    let singleTap2 = UITapGestureRecognizer(target: self, action: #selector(selected1))


    
    private func setupMain() {
        view.addSubview(firstView)
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0))
        
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: firstView, attribute: .bottom, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0))
        regularConstraints.append(NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0))
        
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
        
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .leading, relatedBy: .equal, toItem: firstView, attribute: .trailing, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 0.5, constant: 0))
        compactConstraints.append(NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
        
        firstImage.heightAnchor.constraint(equalTo: firstView.heightAnchor, multiplier: 0.9).isActive = true
        firstImage.widthAnchor.constraint(equalTo: firstView.widthAnchor, multiplier: 0.9).isActive = true
        firstImage.centerXAnchor.constraint(equalTo: firstView.centerXAnchor).isActive = true
        firstImage.centerYAnchor.constraint(equalTo: firstView.centerYAnchor).isActive = true
        
        secondImage.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 0.9).isActive = true
        secondImage.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.9).isActive = true
        secondImage.centerXAnchor.constraint(equalTo: secondView.centerXAnchor).isActive = true
        secondImage.centerYAnchor.constraint(equalTo: secondView.centerYAnchor).isActive = true
        
        firstImage.isUserInteractionEnabled = true
        secondImage.isUserInteractionEnabled = true
        firstImage.addGestureRecognizer(singleTap)
        secondImage.addGestureRecognizer(singleTap2)


        
    }
    
    @objc func selected0() {
        animalSelected(0)
    }
    
    @objc func selected1() {
        animalSelected(1)
    }
    
    
    @objc func animalSelected(_ selected:Int){
        print("pressed")
        firstImage.isUserInteractionEnabled = false
        secondImage.isUserInteractionEnabled = false
        let animals = DataHandler.currSelectedAnimals()
        print(animals[0].id, animals[1].id)
        let firstGreater: Bool = animals[0].score > animals[1].score
        print(firstGreater)
        if (selected == 0 && firstGreater) || (selected == 1 && !firstGreater) {
            self.correctGuesses += 1
            DataHandler.getAll(gameType:"Guesser", completion: reloadComplete(_:))
        } else {
            performSegue(withIdentifier: "finish", sender: self)
        }
    }
    
    private func reloadComplete(_ animalImages: [UIImage]?) {
        firstImage.image = animalImages![0]
        secondImage.image = animalImages![1]
        firstImage.isUserInteractionEnabled = true
        firstImage.addGestureRecognizer(singleTap)
        secondImage.isUserInteractionEnabled = true
        secondImage.addGestureRecognizer(singleTap2)
        
    }
    

}
