//
//  SettingViewController.swift
//  ranker
//
//  Created by Ju An Oh on 3/17/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var currentSelection: UILabel!
    
    @IBAction func dog(_ sender: Any) {
        AnimalType.animal = "dog"
        currentSelection.text = "Dog"
        print(AnimalType.animal)
    }
    
    @IBAction func cat(_ sender: Any) {
        AnimalType.animal = "cat"
        currentSelection.text = "Cat"
        print(AnimalType.animal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
