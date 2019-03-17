//
//  RankerViewController.swift
//  ranker
//
//  Created by Anukriti Goyal on 10/3/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class RankerViewController: UIViewController {
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    var pressed = true
    
    var firstIndex = 0;
    var secondIndex = 1;
    
    var img1id = "";
    var img2id = "";
    
    
    var array = [1, 2, 3, 4, 5, 6, 7, 8]
    var chosen = -1
    
//    @IBAction func pressed(_ sender: UIButton) {
//        if  sender.tag == 1 {
//            chosen = firstIndex
//        } else {
//            chosen = secondIndex
//        }
//    }
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        
        
//        first.setTitle(String(array[firstIndex]), for: .normal)
//        second.setTitle(String(array[secondIndex]), for: .normal)
        
        DataHandler.getAll(gameType: "Ranker", completion: complete1(_:))
//        let tapimg1 = UITapGestureRecognizer(target: self, action: #selector(img1Selected))
//        img1.isUserInteractionEnabled = true
//        img1.addGestureRecognizer(tapimg1)
//
//        let tapimg2 = UITapGestureRecognizer(target: self, action: #selector(img2Selected))
//        img2.isUserInteractionEnabled = true
//        img2.addGestureRecognizer(tapimg2)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "proceed1" {
//            let vc = segue.destination as! ChosenViewController
//            chosen = firstIndex
//            vc.chosen = chosen
//            vc.arrayLength = array.count
//
//        } else if segue.identifier == "proceed2" {
//            let vc = segue.destination as! ChosenViewController
//            chosen = secondIndex
//            vc.chosen = chosen
//            vc.arrayLength = array.count
//        }
//    }
    
    private func complete1(_ lol: [UIImage]?) {
//        self.loadingStackView.isHidden = true
//        self.startGameButton.isHidden = false

//        first.setImage(lol![0], for: UIControl.State.normal)
//        second.setImage(lol![1], for: UIControl.State.normal)
        guard let currImages = lol else {
            // send an alert and reroute back to homepage
            // something like, "you've already guessed on all the animals!
            return
        }
        print(currImages)
        img1.image = currImages[0]
        img2.image = currImages[1]
        img1id = DataHandler.currSelectedAnimals()[0].id
        img2id = DataHandler.currSelectedAnimals()[1].id
        print(img1id, img2id)
    }
    
//    private func url(_ name: [String]?) {
//        img1id = name![0]
//        print(img1id)
//        img2id = name![1]
//        print(img2id)
//    }
    
    @objc func img1Selected() {
        selected(animal: 0)
    }
    
    @objc func img2Selected() {
        selected(animal: 1)
    }
    
    func selected(animal: Int) {
        
    }
    
//    @IBAction func post() {
//        let score : Int = 0
//        let post : [String : AnyObject] = ["score":score as AnyObject]
//        //        let post : [String : AnyObject] = ["type": type as AnyObject, "score":score as AnyObject]
//        let databaseRef = Database.database().reference()
//        let value : String = databaseRef.child("Posts/Dog/").childByAutoId().key!
//        databaseRef.child("Posts/\(type)").child(value).setValue(post)
//        let storageRef = Storage.storage().reference()
//        let imageString = "\(value).jpg"
//        let imageRef = storageRef.child(imageString)
//        if let uploadData = myImageView.image!.pngData() {
//            imageRef.putData(uploadData, metadata: nil, completion: nil)
//        }
//
//
//        print(value, post)
//    }
}
