//
//  ChosenViewController.swift
//  ranker
//
//  Created by Anukriti Goyal on 10/3/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class ChosenViewController: UIViewController {
    var chosen = -1
    var arrayLength = 0
    
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var finished: UILabel!
    @IBOutlet weak var home: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)

        
        // Do any additional setup after loading the view.
        if chosen < arrayLength - 1 {
            finished.isHidden = true
            home.isHidden = true
            if chosen % 2 == 0 {
                chosen = chosen + 2
            } else {
                chosen = chosen + 1
            }
        }
        
        else {
            finished.isHidden = false
            home.isHidden = false
            back.isHidden = true
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back" {
            let vc = segue.destination as! RankerViewController
            
            vc.firstIndex = chosen
            vc.secondIndex = chosen + 1
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
