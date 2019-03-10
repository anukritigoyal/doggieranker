//
//  RankerViewController.swift
//  ranker
//
//  Created by Anukriti Goyal on 10/3/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class RankerViewController: UIViewController {
    @IBOutlet weak var first: UIButton!
    @IBOutlet weak var second: UIButton!
    
    var pressed = true
    
    var firstIndex = 0;
    var secondIndex = 1;
    
    
    var array = [1, 2, 3, 4, 5, 6, 7, 8]
    var chosen = -1
    
    @IBAction func pressed(_ sender: UIButton) {
        if  sender.tag == 1 {
            chosen = firstIndex
        } else {
            chosen = secondIndex
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        
        
        first.setTitle(String(array[firstIndex]), for: .normal)
        second.setTitle(String(array[secondIndex]), for: .normal)
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
}
