//
//  DoggieRankerStartViewController.swift
//  ranker
//
//  Created by Anukriti Goyal on 10/3/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class DoggieRankerStartViewController: UIViewController {
    
    @IBOutlet weak var start: UIButton!
    @IBAction func touchStartButton(_ sender: Any) {
        performSegue(withIdentifier: "toRanker", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start.backgroundColor = UIColor.darkGray
        start.setTitle("Loading...", for: .normal)
        DataHandler.getAll(gameType: "Ranker", completion: complete)
        start.isUserInteractionEnabled = false
    }
    
    private func complete(_ allImages:[UIImage]? ) {
        guard let imgs = allImages else {
            let alert = UIAlertController(title: "Sorry", message: "You've guessed on all the animals, return to the homescreen", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Back to Homepage", style: .default, handler: {_ in self.backToHome()}))
            self.present(alert, animated: true, completion: nil)
            return
        }
        start.backgroundColor = UIColor(red: 0.13, green: 0.54, blue: 0.13, alpha: 1)
        start.setTitle("Begin!", for: .normal)
        start.isUserInteractionEnabled = true
    }
    
    private func backToHome() {
        performSegue(withIdentifier: "rankerHomeToHome", sender: self)
    }

}
