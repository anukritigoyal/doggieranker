//
//  SettingViewController.swift
//  ranker
//
//  Created by Gabe Bizar on 3/18/19.
//  Copyright © 2019 huskyluverzz. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.75, blue: 0.18, alpha: 1)
        catStock.imageView!.layer.cornerRadius = 35
        dogStock.imageView!.layer.cornerRadius = 35
        catStock.imageView!.layer.masksToBounds = true
        dogStock.imageView!.layer.masksToBounds = true




        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        catStock.imageView?.alpha = 0.6
    }
    @IBOutlet weak var currentSelection: UILabel!
    
    @IBAction func dogPress(_ sender: Any) {
        DataHandler.setAnimal("Dog")
        currentSelection.text = "Doggie!"
        catStock.imageView?.alpha = 0.6
        dogStock.imageView?.alpha = 1

    }
    @IBAction func catPress(_ sender: Any) {
        DataHandler.setAnimal("Cat")
        currentSelection.text = "Kitty!"
        dogStock.imageView?.alpha = 0.6
        catStock.imageView?.alpha = 1

    }
    @IBOutlet weak var dogStock: UIButton!
   
    @IBOutlet weak var catStock: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
