//
//  GuessingGameViewController.swift
//  ranker
//
//  Created by Student User on 3/9/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class GuessingGameViewController: UIViewController {
    
    
    @IBOutlet weak var firstDog: UIImageView!
    @IBOutlet weak var secondDog: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(firstDogSelected))
        firstDog.isUserInteractionEnabled = true
        firstDog.addGestureRecognizer(singleTap)
        let singleTapDog2 = UITapGestureRecognizer(target: self, action: #selector(secondDogSelected))
        secondDog.isUserInteractionEnabled = true
        secondDog.addGestureRecognizer(singleTapDog2)
        // Do any additional setup after loading the view, typically from a nib.
    }
    


    
    //Action
    @objc func firstDogSelected() {
        print("Dog 1 clicked")
    }
    
    @objc func secondDogSelected() {
        print("Dog 2 clicked")
    }
    
}
