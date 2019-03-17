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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        
        
//        first.setTitle(String(array[firstIndex]), for: .normal)
//        second.setTitle(String(array[secondIndex]), for: .normal)
        
        DataHandler.getAll(gameType: "Ranker", completion: complete1(_:))
        let tapimg1 = UITapGestureRecognizer(target: self, action: #selector(img1Selected))
        img1.isUserInteractionEnabled = true
        img1.addGestureRecognizer(tapimg1)

        let tapimg2 = UITapGestureRecognizer(target: self, action: #selector(img2Selected))
        img2.isUserInteractionEnabled = true
        img2.addGestureRecognizer(tapimg2)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proceed1" {
            let vc = segue.destination as! ChosenViewController
            chosen = firstIndex
            vc.chosen = chosen
            vc.arrayLength = array.count

        } else if segue.identifier == "proceed2" {
            let vc = segue.destination as! ChosenViewController
            chosen = secondIndex
            vc.chosen = chosen
            vc.arrayLength = array.count
        }
    }
    
    private func complete1(_ lol: [UIImage]?) {
//        self.loadingStackView.isHidden = true
//        self.startGameButton.isHidden = false

        guard let currImages = lol else {
            let alert = UIAlertController(title: "Sorry!", message: "You've already guessed on all the animals!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Return home", style: UIAlertAction.Style.default, handler:{
                (act: UIAlertAction) in
                self.returnToHomeScreen()
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }


        img1.image = currImages[0]
        img2.image = currImages[1]
        img1id = DataHandler.currSelectedAnimals()[0].id
        img2id = DataHandler.currSelectedAnimals()[1].id
        print(img1id)
        print(img2id)
    }
    
    @objc func img1Selected() {
        selected(0)
    }
    
    @objc func img2Selected() {
        selected(1)
    }
    
    func selected(_ selectedAnimal: Int) {
        // If we want to do anything before posting otherwise we can remove this method with just post()
        post(selectedAnimal)
    }
    
    func returnToHomeScreen() {
        let HomeView = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! ViewController
        self.present(HomeView, animated: true, completion: nil)
    }
    
    func post(_ selectedAnimal: Int) {
        let name = DataHandler.currSelectedAnimals()[selectedAnimal].id
        DataHandler.currSelectedAnimals()[selectedAnimal].score = DataHandler.currSelectedAnimals()[selectedAnimal].score + 1
        let score = DataHandler.currSelectedAnimals()[selectedAnimal].score
        
        let databaseRef = Database.database().reference()
        //databaseRef.child("Posts/\(type)").child(value).setValue(post)
        databaseRef.child("Posts/Dog/\(name)/score/").setValue(score)
    }
    
}
